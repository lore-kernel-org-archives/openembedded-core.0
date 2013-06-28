Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51ABD6A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:28:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5SJSO54028263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:28:24 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 12:28:24 -0700
Message-ID: <51CDE3D7.5060908@windriver.com>
Date: Fri, 28 Jun 2013 14:28:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 19:28:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/13 2:23 PM, Saul Wold wrote:
> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
> defined in the security_flags.inc and override the empty default.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/conf/bitbake.conf | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 62a3936..72e1a78 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -493,7 +493,8 @@ export TARGET_CPPFLAGS = ""
>
>   export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>   BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
> -export CFLAGS = "${TARGET_CFLAGS}"
> +SECURITY_CFLAGS ?= ""
> +export CFLAGS = "${TARGET_CFLAGS} ${SECURITY_CFLAGS}"
>   export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"

I would prefer if the cflags came in via the TARGET_CFLAGS, similar to how the 
selected_optimization works.  In the past we've hacked around with CFLAGS itself 
and in the end it's always seem to have caused problems.  By modifing 
TARGET_CFLAGS instead, then the user can do (in a recipe):

CFLAGS = "-fmy-custom-flag ${TARGET_CFLAGS}"

>   export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
> @@ -523,7 +524,8 @@ LINKER_HASH_STYLE_mips64 = "sysv"
>   LINKER_HASH_STYLE_mips64el = "sysv"
>   TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
>
> -export LDFLAGS = "${TARGET_LDFLAGS}"
> +SECURITY_LDFLAGS ?= ""
> +export LDFLAGS = "${TARGET_LDFLAGS} ${SECURITY_LDFLAGS}"

Same comment here.

>   export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>   #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
>   #                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
>


