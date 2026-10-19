Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABB4CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:39:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33489.1792413592396357745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fKyaGcf7;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso14484975e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792413591; x=1793018391; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bssEG70ZIjdGhV1nJkiOccAtAAgc0vnA1fl/htrVnEs=;
        b=fKyaGcf73Oc4YvGYdRTuBsYjlAGgNp456QqOHWJXFe78xu01WFZfxMcmKOAOCEF+4Q
         a/moQys3mkqHGLYHINcovaCLvUI42/MeyRtHXUppNYg4G1zElSnr8w94PU2KqlN4VXVf
         AI6EYcZwVBUTUF0lG0+xex8ToR5Ik9eWjFMNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413591; x=1793018391;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bssEG70ZIjdGhV1nJkiOccAtAAgc0vnA1fl/htrVnEs=;
        b=hD3gmcwVB7faFs570/XlJL6+VmV9LfKwgbJi609Uo5IxzOg0R3UIhu4shafAdyrvhV
         1RX+f7zdBraH/BmIJECpTYNj+cpP2GdDt5Inw59XeqdUlFDnI2CWjQrzqrhFTGXdH5f6
         92tNi6MKggiI1WyRm1TQwZ7rgcJBaba0s+TSGKggMITxiEwOEbrFxgIiePPNP40LDQjX
         vNhmUIMfu3MQBILUzd0/+grjztSatgx/fTSVW5k6KrA5ehq6bqbtSGP8TYlPtrq43mtS
         cepO1YPysyCsZyglsnxRitw/23PLGGFZKUPntFkdGOJzD7avdHigy5cHffudRyYgl1km
         5/dw==
X-Forwarded-Encrypted: i=1; AKwUvBwOd0X8xd7u9/QpfWDaYYhSuog4DGD1RtG1D4JYUhF4uVTMWiWcutoGqTwToMg9gAKygVe5LOiac2AcxCEnHfpUiw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJBEPQDyCc9vDQOARQgPujusjycJDgQsrDvg1t8vz4ixc8exTIP
	9l/sjFQyADCHYTA9E27iEut+/w5uRBPz0+hLNs+M+IcqexgPERGbVld8GxivQml25U8=
X-Gm-Gg: AYBFou3gOzapdi/D/72mpMXEaNglhnK+jjqo9C3Akj9Q6PEmf9RlSz9Y26e2wHyt9/v
	ychALcGfNn+b0e8Lc69vFZRs+8UqcY+FLM2cVIa9EwNaXxNobCe9F2M9A5hz0GnbvC2DFeMy4hX
	JuA7EeNj6ZfHZ01QCYt+3SZN+b/HV9I9ZSSlOAZEewEsIeamLNiQvDFzE9IUKW4JHQeY9iVZyFO
	++IJHYVJbk7kdds93QlhuWbRimVbIuDs3ctr7LARHMJN9lLDAS9tpli9c9pPnFB0ucU/DgY3+wr
	22q2ikqTs0aEdhNGmiMMufeeYJHHc1rQSn1b+5Tz3Niry2gE90wZlt3BahmFClm5DjVwkbDQeo0
	iCCRSG9rybHHmErtqCLzreAZkWEmeIb6WB2hBk/mSM5SUEiO5x4cboojLEpsygheLvoyJuIAaMI
	by+EavRSA0VWp4ggsYgIqESQQqlPOgJTXOrgIC4KifcVt+Kb4pVxToUJWf5jD3tlFwdM7sW/INn
	GHHZCW63YYg00a1R8f2wETgIbhdl0CexND9YNTUGLdLheZzvQaZ27CX9qFIA7bdJ44NDuBe
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr203462395e9.23.1792413589466;
        Mon, 19 Oct 2026 05:39:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50ae5esm25357024f8f.51.2026.10.19.05.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:39:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 14:39:48 +0200
Message-Id: <DM8TL789XUC2.14YZSGS40TQTN@smile.fr>
To: <Roopa.Kalmath@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH v4] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
 <20261013114106.2090607-1-Roopa.Kalmath@windriver.com>
In-Reply-To: <20261013114106.2090607-1-Roopa.Kalmath@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248164

On Tue Oct 13, 2026 at 1:41 PM CEST, Roopa via lists.openembedded.org Kalma=
th wrote:
> Backport commit[1] which fixes this vulnerability as mentioned NVD
> report in [2].
>
> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefa=
c6aae974f9cec72fd6e58f1bc
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-29009
>
> Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> ---
>  .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

Thanks!

It's good now. You should see this patch in the next review cycle/merge.

Regards,
--=20
Yoann Congal
Smile ECS


