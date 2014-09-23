Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 149DD65D59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:13:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8N7DFKa004176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:13:15 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 00:13:14 -0700
Message-ID: <54211D89.6080900@windriver.com>
Date: Tue, 23 Sep 2014 15:13:13 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <1410847428-15590-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1410847428-15590-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: fix the DEPENDS setting
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
X-List-Received-Date: Tue, 23 Sep 2014 07:13:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop this, I see Christopher Larson' patch has been merged.


commit fce2be6dcf8e7320b7b9df9947745e78fd160815
Author: Christopher Larson <chris_larson@mentor.com>
Date:   Tue Sep 16 18:22:02 2014 -0700

     flex: fix the deps for ptest builds

     Building the tests for flex requires flex-native and bison-native, 
but the
     attempt to add this dependency was done incorrectly. Use an inline 
python
     conditional based on PTEST_ENABLED instead.

     Signed-off-by: Christopher Larson <chris_larson@mentor.com>

diff --git a/meta/recipes-devtools/flex/flex.inc 
b/meta/recipes-devtools/flex/flex.inc
index 54e4ec3..a4a26e2 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -5,6 +5,7 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"

  SECTION = "devel"
  LICENSE = "BSD"
+DEPENDS += "${@'bison-native flex-native' if '${PTEST_ENABLED}' == '1' 
else ''}"

  SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
             file://run-ptest \
@@ -28,7 +29,6 @@ do_install_append_class-nativesdk() {
  }

  RDEPENDS_${PN} += "m4"
-DEPENDS_${PN}-ptest += "bison-native flex-native"

  do_compile_ptest() {
         for i in `find ${S}/tests/ -type d |grep -Ev 
"concatenated-options|reject|table-opts" | awk -F/ '{print $NF}'`; \

-Roy

On 09/16/2014 02:03 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> DEPENDS does not support the override, fix it by checking the DISTRO_FEATURE
> with ptest
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/flex/flex.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 54e4ec3..bd12f69 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -28,7 +28,7 @@ do_install_append_class-nativesdk() {
>   }
>
>   RDEPENDS_${PN} += "m4"
> -DEPENDS_${PN}-ptest += "bison-native flex-native"
> +DEPENDS +=  "${@base_contains('DISTRO_FEATURES', 'ptest', 'bison-native flex-native', '', d)}"
>
>   do_compile_ptest() {
>   	for i in `find ${S}/tests/ -type d |grep -Ev "concatenated-options|reject|table-opts" | awk -F/ '{print $NF}'`; \
>

-- 
Best Reagrds,
Roy | RongQing Li

