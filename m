Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D325260722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 15:29:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7OFTQDK032421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 08:29:26 -0700
Received: from [128.224.56.232] (128.224.56.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Aug 2016 08:29:23 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1471371380-21952-1-git-send-email-jslater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7d4ba06b-e9d5-a518-68b8-1d5f01ea34bf@windriver.com>
Date: Wed, 24 Aug 2016 11:29:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471371380-21952-1-git-send-email-jslater@windriver.com>
X-Originating-IP: [128.224.56.232]
Subject: Re: [PATCH 1/1] useradd: do not delete users and groups during configure
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
X-List-Received-Date: Wed, 24 Aug 2016 15:29:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-16 02:16 PM, Joe Slater wrote:
> If two recipes both create the same users and groups, the
> second recipe can delete items created by the first causing
> things like "chown" to fail for the first recipe.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/useradd.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 8d51fb5..6df9822 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -129,7 +129,7 @@ useradd_sysroot_sstate () {
>
>  userdel_sysroot_sstate () {
>  if test "x${STAGING_DIR_TARGET}" != "x"; then
> -    if [ "${BB_CURRENTTASK}" = "configure" -o "${BB_CURRENTTASK}" = "clean" ]; then
> +    if [ "${BB_CURRENTTASK}" = "clean" ]; then
>          export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
>          OPT="--root ${STAGING_DIR_TARGET}"
>
>


I don't see this in oe-core/master[-next] yet.

Is there a better solution or should the recipes
that create the user (ftp in this case), be modified some how?

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

