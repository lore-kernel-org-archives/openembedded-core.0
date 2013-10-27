Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id AED0A6C770
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 07:51:28 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so1897091lbh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lpLN6IZMzphmKseqEEXXrOjB3V80cavflieqcVyJV0w=;
	b=Wro3Kiu6OZi58yQkM4icuJjfoHvR7EEXi4Gd9b6CRMG0Qqnpm5fBT0p6xAUvTKgtBC
	SqES23wzfsGH8nX+iHSiyAHChsddmSNacn2mZjkg8368SUQzoCjtDIOD3ixiDhxbEbwa
	GNUT36a+g5xOgXv9KS669vlhWUC2cP+9tVoq1l6B6jWBbok66F0FWKOI9w4UfchcQj84
	NoYc1ZkTV0E2b3CW1UgWjJnBaA9E/5ahs8Oswm6e5W4owON9XVgLOpDcfk4AnaNufP56
	YUycC/AVMERSnwKTEbrgcOqY6OSHUBFp99uyC4USigH74BKtlnLCvJa58NTL65+tbFQ8
	xhZw==
X-Received: by 10.152.243.34 with SMTP id wv2mr10473651lac.2.1382860288907;
	Sun, 27 Oct 2013 00:51:28 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id qj3sm4884590lbb.6.2013.10.27.00.51.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Oct 2013 00:51:28 -0700 (PDT)
Message-ID: <526CC5FF.7030404@gmail.com>
Date: Sun, 27 Oct 2013 08:51:27 +0100
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>	<526CBE56.8010406@gmail.com>
	<CAPbeDC=LTDOjrpP0XHXcAJVVtmVBZ9tiLm9iJ_MvXFypa0uWMg@mail.gmail.com>
In-Reply-To: <CAPbeDC=LTDOjrpP0XHXcAJVVtmVBZ9tiLm9iJ_MvXFypa0uWMg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 27 Oct 2013 07:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2013-10-27 8:25, Jacob Kroon wrote:
> Hi Hans,
> I'm far from being a scripting-expert, so I just did what I could in order to 
> get rid of the warning and stop the service.
> Sending this patch was just a way to raise some attention to the bug and get 
> some discussion going :-)
No problem ;)
Try this instead

if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
                echo stop
fi

Thanks.
Hans

> If there are other ways one should proceed instead of sending "broken" patches 
> to the mailing list I will do so in the future.
> Regards
> Jacob
>
>
> On Sun, Oct 27, 2013 at 8:18 AM, Hans Beckerus <hans.beckerus@gmail.com 
> <mailto:hans.beckerus@gmail.com>> wrote:
>
>     On 2013-10-27 12:36, Jacob Kroon wrote:
>      > When running the postinst script I get a shell warning:
>      >
>      > sh: argument expected
>      >
>      > and the service is never stopped. This patch fixes the warning
>      > message and stops the service.
>     This patch does not look right to me?
>     If length of $(D) is zero the condition will *always* be true. Instead of
>     actually testing the existence of "${INIT_D_DIR}/${INITSCRIPT_NAME}" it is
>     now simply converted to a string. What did I miss ;)
>
>     Thanks.
>     Hans
>
>      > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
>     <mailto:jacob.kroon@gmail.com>>
>      > ---
>      >  meta/classes/update-rc.d.bbclass | 2 +-
>      >  1 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/meta/classes/update-rc.d.bbclass
>     b/meta/classes/update-rc.d.bbclass
>      > index e14659d..835b717 100644
>      > --- a/meta/classes/update-rc.d.bbclass
>      > +++ b/meta/classes/update-rc.d.bbclass
>      > @@ -16,7 +16,7 @@ updatercd_postinst() {
>      >  # test if there is a previous init script there, ie, we are updating the
>     package
>      >  # if so, we stop the service and remove it before we install from the
>     new package
>      >  if type update-rc.d >/dev/null 2>/dev/null; then
>      > -     if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
>      > +     if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>      >               ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>      >       fi
>      >       if [ -n "$D" ]; then
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> -- 
>    -- Jacob


