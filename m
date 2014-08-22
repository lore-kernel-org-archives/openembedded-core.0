Return-Path: <roxana.ciobanu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88D3370F46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2014 01:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; 
	d="scan'208,217";a="580310905"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:34 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:42 +0300
Message-Id: <2dc12c2d3d7a743194eb4a73be664822d0d0cb70.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 6/9] error-report: remember state of the menu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Aug 2014 08:49:41 -0000

Remember the state of the menu, so that people are
not forced to customise the columns every
time they search.

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 templates/base.html           |  2 +-
 templates/search-details.html | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/templates/base.html b/templates/base.html
index 01453c7..a6f0cf0 100644
--- a/templates/base.html
+++ b/templates/base.html
@@ -60,7 +60,7 @@
 		<script type = "text/javascript" src = "{% static "js/bootstrap.min.js" %}"></script>
 		<script type = "text/javascript" src = "{% static "js/d3.v2.js" %}"></script>
 		<script type = "text/javascript" src = "{% static "js/nv.d3.js" %}"></script>
-		
+	    <script type = "text/javascript" src = "{% static "js/jquery.cookie.js" %}"></script>
 		{% block content %}{% endblock %}
 	</body>
 </html>
diff --git a/templates/search-details.html b/templates/search-details.html
index 269aa62..fb1f3c1 100644
--- a/templates/search-details.html
+++ b/templates/search-details.html
@@ -14,6 +14,15 @@
 			else {
 				$('.' + clname ).hide( 100 );
 			}
+			// save cookie for all checkboxes$
+			save = '';
+			$( '.chbxtoggle' ).each(function( ) {
+				if ( $( this ).attr( 'id' ) != undefined ) {
+					save += ';' + $( this ).attr( 'id' ) +':'+ $( this ).is( ':checked' )
+				}
+			});
+			$.cookie( '_displaycols_{{objectname}}', save );
+			save = '';
 		}
 		</script>
 
@@ -163,6 +172,25 @@
 				<script>
 				$(document).ready(function() {
 					$('.commit > div').popover({placement:'left'})
+
+					// we load cookies for the column display$
+					save = $.cookie('_displaycols_{{objectname}}');
+					if (save != undefined) {
+						setting = save.split(';');
+						for ( i = 0; i < setting.length; i++) {
+							if (setting[i].length > 0) {
+								splitlist = setting[i].split(':');
+								id = splitlist[0], v = splitlist[1];
+								if (v == 'true') {
+									$('.chbxtoggle#'+id).prop('checked', true);
+								}
+								else {
+									$('.chbxtoggle#'+id).prop('checked', false);
+								}
+							}
+						}
+					}
+					
 					$('.chbxtoggle').each(function () {
 						showhideTableColumn($(this).attr('id'), $(this).is(':checked'))
 					});
-- 
1.9.1


