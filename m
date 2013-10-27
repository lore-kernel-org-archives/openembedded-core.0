Return-Path: <hans.beckerus@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEE36D0F0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 07:18:47 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hp15so4215403lab.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=H2aSkJzw5FStvOCsDMgIAQ0zMqi4DwI2hb/3Ccs6TSo=;
	b=CeJYx8lTD+AXc1pg4M5B/qg7VH2MKuzhFMkzo9eeBzQu64dXzbK9wERshceH40ulf+
	VdKr3KzJkWEmRDCWEvjvanLM2rF3VXYjNc1cbK2sDqnp3j6j/fTEFp2U0Q44ldn9kbhm
	/Y6o5M0JrM0neJ4HUNe3IvTjMfIVFDlQaXypEyQE36Q2ITYlDch8CK53iXnsZgEOi1DL
	AFVhSfsmjXpq1dGbayvVBhbWaoDLHEW3I0iTHAoi8Xox62MuonRcy1T800Nzg/ZIKLV6
	/ARzBo1Hfo7MI/7DsKLNSloF/Lpo8ryLS3zWmHpV8fqXFvA1da/orZmKYS4qf+ZNZXTg
	SaoA==
X-Received: by 10.152.88.20 with SMTP id bc20mr615882lab.37.1382858328183;
	Sun, 27 Oct 2013 00:18:48 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id zc3sm8542642lbb.2.2013.10.27.00.18.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Oct 2013 00:18:47 -0700 (PDT)
Message-ID: <526CBE56.8010406@gmail.com>
Date: Sun, 27 Oct 2013 08:18:46 +0100
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
In-Reply-To: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
Subject: Re: [PATCH] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sun, 27 Oct 2013 07:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2013-10-27 12:36, Jacob Kroon wrote:
> When running the postinst script I get a shell warning:
>
> sh: argument expected
>
> and the service is never stopped. This patch fixes the warning
> message and stops the service.
This patch does not look right to me?
If length of $(D) is zero the condition will *always* be true. Instead of actually testing the existence of "${INIT_D_DIR}/${INITSCRIPT_NAME}" it is now simply converted to a string. What did I miss ;)

Thanks.
Hans

> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index e14659d..835b717 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -16,7 +16,7 @@ updatercd_postinst() {
>  # test if there is a previous init script there, ie, we are updating the package
>  # if so, we stop the service and remove it before we install from the new package
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
> +	if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>  		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  	fi
>  	if [ -n "$D" ]; then


