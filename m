Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9BCD62073
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:04:11 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.26792.1732035847778739156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpOMyx0y;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d41b209858so7795456d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732035847; x=1732640647; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PWOia6Y+d91BMDly8+Ug3hscP6NJNHzy93mn3bSCzkM=;
        b=RpOMyx0ywRmYtQLOBdP/XwVd85DRF3hx4iIJp2AHfXT+PSojlp5s/5hzeBLO1pJqVL
         EInLdPETugw/W9fWQNLFxd5DJnuovjg8RnBullk2qn36vS96W6zLatTPd+HKkXlle1Io
         PwY0l4gj18yCQYWk+Sz3OkjaGP3VCA7GWxEx/dpn/R9u1WhPE+ZSETWqDXU/Ny3hMPyH
         iiYENLLqXdEp2nf2koELpRMXKPhPn/MKwtfwkzBq55T14/Y/Qy53xVWw6hROnAJgtLeT
         W8MNJTKdhiN88JCXUs4e04A+Wb/e++S20lhca8Jzr2ttVULUFOv/HGLuW9S9w0VLfud+
         0KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732035847; x=1732640647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWOia6Y+d91BMDly8+Ug3hscP6NJNHzy93mn3bSCzkM=;
        b=r60TePtPtG1I4Eeqavs+j6ZBGnUg08SO1eEev6eUPWha5p+E/p+WWk2PfwyktLXfnI
         SkoWB0uMO1D6PMVPXDbps9fSGK390TTDjSdth1FG/zFd7HOJDmyKqlMCpA0tQ3P4z9Ej
         T6065gyTTLkWMxifZD7yjIRrqw061dUfyno4dlblKp8m1FVepM8Ut2NFXQUCJ9m3t0f6
         fdlcbCMFaulMcNDf2agLJt3ZVR0wFFjITrPd3Of+lqUNoupEi6uiDpMvzByL9s0uJDOr
         8nMPejmDH2j4liJoQP0L664V5MjgfdZGRlypk+UXYwKJZetyfdXX1bQHSPYMGUver15H
         vrBg==
X-Forwarded-Encrypted: i=1; AJvYcCWfFpybHbZgaYWeafW9yCcgFA35CCy9QigoDJqNWT+a6DEHvsHGDg9sUlOIWvjXYC27ztp4GmZTHNBg+j6aK03riw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+iAzVr6aLmT3g/japoYhtO8gH+zc+Eux3MW2p9DmmN04MD79p
	lgWBY2/4x8iqdnWBt7yD28gUKCaYfd4HVbmhjuIArx4o71ZW0S9eygbOXvMUK3ixlUeFe/K6hwc
	r4rveyEvNsyMkHm3DdWK1tJcJu+c=
X-Google-Smtp-Source: AGHT+IEqNFqk8I4Ol99n2wVQWdWmMjaWfSAnD/wxGAjp9Mr9xfyLC98t7phfWzHr2FYjIskAARU2dt+BPX4zHfZj3RA=
X-Received: by 2002:a05:6214:2405:b0:6d4:2646:109c with SMTP id
 6a1803df08f44-6d4264613a3mr88642896d6.3.1732035846762; Tue, 19 Nov 2024
 09:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com> <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2024 18:03:55 +0100
Message-ID: <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000062787a06274705fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207396

--00000000000062787a06274705fb
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2024 at 14:24, Virendra Kumar Thakur <
Virendra.Thakur@kpit.com> wrote:

> in yocto , Libyaml are sourced from
> https://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz
>
> when I tried to run the test using above source . It only execute two test
> binary.
>
> yaml-0.2.5/tests$ make check-TESTS
> make[1]: Entering directory 'yaml-0.2.5/tests'
> PASS: test-version
> PASS: test-reader
>

If you take a look at upstream's top level Makefile.am, it has an
additional target:

=============
test-suite: tests/run-test-suite all
make -C $< test

test-all: test test-suite

tests/run-test-suite:
ifeq ($(LIBYAML_TEST_SUITE_RUN_REPO),$(LIBYAML_TEST_SUITE_RUN_REPO_DEFAULT))
 -git branch --track $(LIBYAML_TEST_SUITE_RUN_BRANCH)
origin/$(LIBYAML_TEST_SUITE_RUN_BRANCH)
 -git worktree prune
 git worktree add $@ $(LIBYAML_TEST_SUITE_RUN_BRANCH)
    else
 git clone --branch $(LIBYAML_TEST_SUITE_RUN_BRANCH)
$(LIBYAML_TEST_SUITE_RUN_REPO) $@
    endif
============

Presumably, running 'make test-all' will fetch the needed test data from
somewhere on the internet, and then use it to run additional tests. Can you
please try that, and see what happens? Then we can probably just use the
data from that repo by putting it into SRC_URI.

Alex

--00000000000062787a06274705fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Nov 2024 at 14:24, Virendra Kumar Thakur &lt;<a href=3D"m=
ailto:Virendra.Thakur@kpit.com">Virendra.Thakur@kpit.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg27=
39697503895351969">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
in yocto , Libyaml are sourced from <a href=3D"https://pyyaml.org/download/=
libyaml/yaml-0.2.5.tar.gz" id=3D"m_2739697503895351969OWAcac45923-aff1-dad8=
-cbcf-a0a89326bffa" target=3D"_blank">
https://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
when I tried to run the test using above source . It only execute two test =
binary.</div>
<div id=3D"m_2739697503895351969Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
yaml-0.2.5/tests$ make check-TESTS</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
make[1]: Entering directory &#39;yaml-0.2.5/tests&#39;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
PASS: test-version</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
PASS: test-reader</div></div></div></div></blockquote></div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">If you take a look at upst=
ream&#39;s top level Makefile.am, it has an additional target:</div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br></div><div class=3D"gmail_quote">test-suite: tests=
/run-test-suite all<br>	make -C $&lt; test<br><br>test-all: test test-suite=
<br><br>tests/run-test-suite:<br>ifeq ($(LIBYAML_TEST_SUITE_RUN_REPO),$(LIB=
YAML_TEST_SUITE_RUN_REPO_DEFAULT))<br>	 =C2=A0-git branch --track $(LIBYAML=
_TEST_SUITE_RUN_BRANCH) origin/$(LIBYAML_TEST_SUITE_RUN_BRANCH)<br>	 =C2=A0=
-git worktree prune<br>	 =C2=A0git worktree add $@ $(LIBYAML_TEST_SUITE_RUN=
_BRANCH)<br>=C2=A0 =C2=A0 else<br>	 =C2=A0git clone --branch $(LIBYAML_TEST=
_SUITE_RUN_BRANCH) $(LIBYAML_TEST_SUITE_RUN_REPO) $@<br>=C2=A0 =C2=A0 endif=
</div><div class=3D"gmail_quote">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Presuma=
bly, running &#39;make test-all&#39; will fetch the needed test data from s=
omewhere on the internet, and then use it to run additional tests. Can you =
please try that, and see what happens? Then we can probably just use the da=
ta from that repo by putting it into SRC_URI.</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000062787a06274705fb--

