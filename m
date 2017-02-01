Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF7D71C10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 20:43:18 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id k15so285632620qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 12:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oUDlbZq/sGH1alAB7rsxSRwN/8KFBRTbZCf0/w5LmOI=;
	b=ih1lb41vRwScZZL5BF/7bG8EJRXHkfWy7Zv8K1joY0gyQRasn9uiEkLeZIk8B3QsUo
	QWQBHRiGP66w5Yh1YjX41C6Qg5pgoLRsFdfKz+PKS9M3S7yb2isYlXp3PwhGl1sCVzl5
	94WamZvDWh1IpSsT0cAIwFlwhTlW+brrpyX/N2e8sWqzV1E8muNvOBl2cLnl440a8bIK
	tk0CQ35qdghoXlI5AhmzKWVk2y/xxMrkszCUc5kNsjBdJUABU1Y+PttG97Gs9ERCgq8r
	YJ7iYF2HOIoQ6Fb8DHeohGFHCFVqfRa86RpMrYy3G85FrygLvqT1Oa12IL8uVIEZkKCd
	tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oUDlbZq/sGH1alAB7rsxSRwN/8KFBRTbZCf0/w5LmOI=;
	b=gaGE6DvNMqFg86JafuJ+M0fc3zFZcj7kWTgCZp5CSc+VxNb069Y9bW4aTJkLdRV/WX
	PezMj1btszySdaJhRpfNvmU0dHpPX5rzAuFaOREhxZl7akhmvirpfuFBpWQApBgZM0SV
	sxRCiC/tGWDpw+uyZRtpV0K63Bg/xZ8kHXPJ0iGT4r9rvcfoJ2d8n0phJk63jsgGtsNW
	g8UbA0dIeyl7icasPJRUQqVmnfEVbuTTkqp6hvDDbxwTtwazchj+D8YHpFFq+LZMgoQi
	Ouxf4LV9nrWf3Eew+R6F75YoARncLECiSqdlIsUjCA7Q0rIMB4KE0nPO7MUCIVfzmcgX
	6OKA==
X-Gm-Message-State: AIkVDXIjvd8xI9Oy2XxS6nDOYSbu65dD/pbctJZUsQ6IhkE60Ups/Y3dKbsSw+Ftv0v5fUbSMMpr4pVmB+OElFtG
X-Received: by 10.237.39.148 with SMTP id a20mr4773609qtd.65.1485981799143;
	Wed, 01 Feb 2017 12:43:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 1 Feb 2017 12:42:58 -0800 (PST)
In-Reply-To: <1485972323-9884-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1485972323-9884-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Feb 2017 20:42:58 +0000
Message-ID: <CAJTo0LaE6VRgK_say=emAmTVOOho0BmuStCoCfAeuCWKNwUvDw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/archiver: invalidate stamps instead of removing TMPDIR
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
X-List-Received-Date: Wed, 01 Feb 2017 20:43:20 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d8481d1905477e1948

--f403045ee6d8481d1905477e1948
Content-Type: text/plain; charset=UTF-8

On 1 February 2017 at 18:05, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> -        shutil.rmtree(get_bb_var('TMPDIR'))
> -        bitbake("%s %s" % (include_recipe, exclude_recipe))
> +        bitbake("-C fetch %s" % include_recipe)
> +        bitbake("-C fetch %s" % exclude_recipe)
>

You'll probably want to have a cleanup of the recipes to remove the tainted
stamps: bitbake -cclean for the recipes will do it.

Ross

--f403045ee6d8481d1905477e1948
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2017 at 18:05,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":66o" class=3D"a3s aXjCH m159fad411d836936">-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 shutil.rmtree(get_bb_var(&#39;<wbr>TMPDIR&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;%s %s&quot; % (include_recipe, e=
xclude_recipe))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-C fetch %s&quot; % include_reci=
pe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-C fetch %s&quot; % exclude_reci=
pe)</div></blockquote></div><br>You&#39;ll probably want to have a cleanup =
of the recipes to remove the tainted stamps: bitbake -cclean for the recipe=
s will do it.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--f403045ee6d8481d1905477e1948--
