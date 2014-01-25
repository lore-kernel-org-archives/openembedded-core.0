Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 670416E3C1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 22:10:55 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id c10so5705479igq.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 14:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jyHZPO8vYMAmVhb8pwzcsWzaidwa+WQXvw6m/3pBIFo=;
	b=ahPWGKrnk6JliX2HAOaslUgN0Go0V9SjL5+FFk0bM4TPw1niEgNFVjUXyRYVuTvkEx
	szZwn/VMSdbgUAvGrEfFESN1jMDB66biTfft1nF7VD1UsIl22l5Mt5zdiUR4eYOZWemS
	ZWRU9LRN9zxGlxSLeUdYV7n35wqOWRf3NR7TdqVifeaBPvrRq8CdxwrmB27ol7Xn04IS
	C0lTc3K6ijJeK1Qm1znDiUMezIE5G7df8nsKPhj66P9aFRN6rLtngVbd1LHN0W1x1m+W
	Unt9NtcFgdNF2gZ4hInRYb6IYGt925/3FBfWzhW8LUk0BFimIQfiRleRkwM+sv4aWygN
	9lYw==
X-Received: by 10.50.154.161 with SMTP id vp1mr10804086igb.17.1390687856336;
	Sat, 25 Jan 2014 14:10:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sat, 25 Jan 2014 14:10:26 -0800 (PST)
In-Reply-To: <1390685105-16717-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1390685105-16717-1-git-send-email-paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2014 14:10:26 -0800
Message-ID: <CAMKF1sqEhyFP8VRTf1m_p3SdURHFeNswT_GtrE8aj6Pqwak2xQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/buildhistory: fix expansion of escape sequences
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
X-List-Received-Date: Sat, 25 Jan 2014 22:10:55 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for fixing it. Looks correct to me

Acked-by: Khem Raj <raj.khem@gmail.com>

On Sat, Jan 25, 2014 at 1:25 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> OE-Core commit 259b8718a31b886f8a158aeb5de164840c9a28b2 fixed UTF-8
> errors but broke decoding of escape sequences in strings (e.g.
> pkg_postinst scripts had \n \t in them instead of newlines and tabs.)
> We need a second call to decode() here as specifying 'string_escape' as
> the second parameter won't do anything.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/buildhistory.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index e9a9c3b..debeea8 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
>                  key = item[0]
>                  if key.endswith('_' + pkg):
>                      key = key[:-len(pkg)-1]
> -                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
> +                pkgdata[key] = item[1].decode('utf-8').decode('string_escape')
>
>          pkge = pkgdata.get('PKGE', '0')
>          pkgv = pkgdata['PKGV']
> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

