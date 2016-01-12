Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 685EB6FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:04:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C24QNF013335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:04:26 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 18:04:25 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1452489034.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56945F28.70608@windriver.com>
Date: Tue, 12 Jan 2016 10:04:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1452489034.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Tue, 12 Jan 2016 02:04:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks all, I updated "glibc-initial.inc: use relative path to run configure",
now it should work for external source:

   git://git.openembedded.org/openembedded-core-contrib rbt/relative
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/relative

Robert Yang (2):
   glibc-initial.inc: use relative path to run configure
   autotools.bbclass: use relative path to run configure script

diff --git a/meta/recipes-core/glibc/glibc-initial.inc 
b/meta/recipes-core/glibc/glibc-initial.inc
index 8e81f09..7214f71 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -11,7 +11,8 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
  do_configure () {
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
-       ${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
+       cfgscript=`python -c "import os; print os.path.relpath('${S}', 
'.')"`/configure
+       $cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
                 --prefix=/usr \
                 --without-cvs --disable-sanity-checks \
                 --with-headers=${STAGING_DIR_TARGET}${includedir} \

// Robert

On 01/11/2016 01:11 PM, Robert Yang wrote:
> Hi,
>
> The 2 patches can reduce a lot of QA Issues for buildpaths.
>
> // Robert
>
> The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:
>
>    image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/relative
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/relative
>
> Robert Yang (2):
>    glibc-initial.inc: use relative path to run configure
>    autotools.bbclass: use relative path to run configure script
>
>   meta/classes/autotools.bbclass            |    4 +++-
>   meta/recipes-core/glibc/glibc-initial.inc |    2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>

