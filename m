Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8644D6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 07:56:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 10 May 2016 00:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,604,1455004800"; d="scan'208";a="972339285"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO [10.252.40.211])
	([10.252.40.211])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2016 00:56:19 -0700
User-Agent: Microsoft-MacOutlook/0.0.0.160212
Date: Tue, 10 May 2016 10:56:18 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <E7380AB9-2F38-424E-BF79-E60ECCF611D2@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v3] base.bbclass wipe ${S} before unpacking
	source
References: <1458665220-26223-1-git-send-email-markus.lehtonen@linux.intel.com>
In-Reply-To: <1458665220-26223-1-git-send-email-markus.lehtonen@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH v3] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 10 May 2016 07:56:38 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Ping,

Any comments on this one?

Discussion on v2 of the patch:
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/119295.html

Cheers,
  Markus



On 22/03/16 18:47, "Markus Lehtonen" <openembedded-core-bounces@lists.openembedded.org on behalf of markus.lehtonen@linux.intel.com> wrote:

>Make sure that we have a pristine source tree after do_unpack.
>
>[YOCTO #9064]
>
>Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>---
> meta/classes/base.bbclass | 12 ++----------
> 1 file changed, 2 insertions(+), 10 deletions(-)
>
>diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>index e066dc9..2acb2b6 100644
>--- a/meta/classes/base.bbclass
>+++ b/meta/classes/base.bbclass
>@@ -133,23 +133,15 @@ python base_do_fetch() {
> 
> addtask unpack after do_fetch
> do_unpack[dirs] = "${WORKDIR}"
>+do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S', True) != d.getVar('WORKDIR', True) else os.path.join(d.getVar('S', True), 'patches')}"
> python base_do_unpack() {
>     src_uri = (d.getVar('SRC_URI', True) or "").split()
>     if len(src_uri) == 0:
>         return
> 
>-    rootdir = d.getVar('WORKDIR', True)
>-
>-    # Ensure that we cleanup ${S}/patches
>-    # TODO: Investigate if we can remove
>-    # the entire ${S} in this case.
>-    s_dir = d.getVar('S', True)
>-    p_dir = os.path.join(s_dir, 'patches')
>-    bb.utils.remove(p_dir, True)
>-
>     try:
>         fetcher = bb.fetch2.Fetch(src_uri, d)
>-        fetcher.unpack(rootdir)
>+        fetcher.unpack(d.getVar('WORKDIR', True))
>     except bb.fetch2.BBFetchException as e:
>         raise bb.build.FuncFailed(e)
> }
>-- 
>2.6.2
>
>-- 
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core


