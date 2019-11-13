Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
	[209.85.222.53])
	by mail.openembedded.org (Postfix) with ESMTP id A7F347D270
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:00:39 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id r22so666685uam.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=qFFPTNiylExhtL2CuPPzHEkVNwYLxdM+yaTvsuC8vEA=;
	b=K8ry8/R8G+V9nsPdfeFt6IrXeKrAuoUylSlP8HDn6eE37XqNYqoLb1mW2XXy9ZWHI8
	MLxOU8Sr9b2LYxeWmMKMLnFlsx2XrNYQcXZpRk6AMg1pNgKicGd30MRlbUNt8mg6BiOw
	2QlmDrIDZp8T1BZchJChrudqCeDaSAbFzByvUHOm+rgdLDlRHcFFa5PsOQrK6mjkUbQu
	/FCiIAxUsFK4BFnsJt42zwKIPjgaXmuko2oPrysp0khCxwKkePwAoeaxYtHpFxzt8OR1
	O1yF5ek4RH1X4bNys8VoL5HiG3oC1njihQL9XlhjPf3Y6nmkeUhd0oWsNn0zqgyeQ1wi
	QDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=qFFPTNiylExhtL2CuPPzHEkVNwYLxdM+yaTvsuC8vEA=;
	b=f41xC+GBKiajGcDjqL0dzK1De5uiOEoL5zMNa8QRza3UGgDXbzSiTFno1kPB+WkHy8
	N5Qf/i9A7iuLgNCSuMgY+VkIAaSjsae26pIWcHPOHOOh6H7jH3OL8TBemDP0P/efxfrx
	Ug5ca2Sa78fmwytiAPyXiNwEO8f1cIP7CBP1TPevwH0erXra8I5cs3p3w+pVWMdu48M9
	/m1MEnmkizdkE4+giIg7544hCZL3t4ES7wVcx6GIvtEdudcvdfJ+7k1QFLbx24NqG4Cr
	7Awv5xYvWrl6mJ40w9b62RRFQ6ubv4KM4qr8dn44+vrnPsiokfjVWzxo1zaJSBiLvMW6
	jIfA==
X-Gm-Message-State: APjAAAXRjJd08WKiS2On3ObdPc+md6SD91IVqOcuFbiL8UmhbTK1iefb
	D9LrBrpsWDsvRv0v3Hjv8f0m3DfL+eqUfn+9VsCK03xB
X-Google-Smtp-Source: APXvYqwD4BgwPjpvIu4Zs3h8YRoMUTlAJm0d54F2A1VAzrPOfO6pM8Ia+m3Eapn58UOPpNUPXbOh9I6fH083mzrhhtU=
X-Received: by 2002:ab0:5557:: with SMTP id u23mr1772530uaa.81.1573653638189; 
	Wed, 13 Nov 2019 06:00:38 -0800 (PST)
MIME-Version: 1.0
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Nov 2019 06:00:26 -0800
Message-ID: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: fetcher uses wrong SRCREV for class-native
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
X-List-Received-Date: Wed, 13 Nov 2019 14:00:39 -0000
Content-Type: text/plain; charset="UTF-8"

With the following test recipe, foo.bb:

  LICENSE = "CLOSED"
  PV .= "+git${SRCPV}"
  SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
  SRCREV_class-native = "fc3e8f717779cabcbe583cac304308eaad5f1648"
  SRC_URI = "git://github.com/file/file.git;protocol=https"
  S = "${WORKDIR}/git"
  BBCLASSEXTEND = "native"

when building foo-native, although SRCREV is set to "fc3..." via the
class-native over-ride, the version of code actually fetched is
"015..":

  $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
  PV="1.0+gitAUTOINC+015b0cdce1"
  SRCREV="fc3e8f717779cabcbe583cac304308eaad5f1648"

A similar problem happens in reverse if SRCREV is set using a machine
specific over-ride, e.g.

  SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
  SRCREV_mymachine = "fc3e8f717779cabcbe583cac304308eaad5f1648"

Now foo-native fetches the target specific version "fc3..." even
though the machine specific over-ride shouldn't effect -native
variants:

  $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
  PV="1.0+gitAUTOINC+fc3e8f7177"
  SRCREV="015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"

Commenting out the line which appends "+git${SRCPV}" to PV seems to be
a workaround which results in the expected version of code being
fetched.

