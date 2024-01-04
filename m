Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADADC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:10:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.922.1704391814097038757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YY8Bvi4+;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e80d14404so1655118e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704391812; x=1704996612; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+aaG9c9g8blXp9EnzdxPe75QI6JsCHyyS3a0HFaPRbY=;
        b=YY8Bvi4+CpDzOMVRawbD/QULT5HsXxIv7fHzQn4I7BL8GfzX/FC7LvBJ/oK0n3vAgl
         QD+BYwzXupG9TXKalWTBK12p5ZXEmAlsZhMl/LqxBkNBByeHBUNHhV4DIS/8YhrpcXnd
         K4rTdl4+6fMY6QwyvIjaggnLmDnLBkgOFcljcnIF3YC83MlE+Xjjx8ij49Fa7aNV2Jgx
         kARfP8yYWpJGnCJdqSa8+ebQBn70XJoHfIUvWFh5QJcxuuqk0a3uCV7JOQMekbafQHzc
         YG7PE1i00daPrap3r+BWYTW9LxB0YFCYqtWYu+UTKOg8ED4+bA7joNNiieRl+98ZPjim
         AT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704391812; x=1704996612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aaG9c9g8blXp9EnzdxPe75QI6JsCHyyS3a0HFaPRbY=;
        b=e4CpJf/YOzVhAdi14AYU8C3faWm+IfpP3gS1UQAgV33XqG+A5B1erF/DZWVctOnY+8
         U805FNj5J9cReh0uSbyf25d7KEN91A28Hg1q5hTkUKOq21/RDehru1/Zs0SIS5UYPe19
         LfAYZof3r0DSLgfnlBhzB5z3pv+4WWlpswucODz+OCOxUcqAJUG37iiraDgcMDNDvZjZ
         vYkRXi1vwbQxxm2FoW9G+Oi82TWWzFTEUaAHByECMTN/bwB4u+T50XYYZuptaPs7qeDm
         hzKbBv+TtnuSC/hHBhBkXZClkIhaNhavSCaiBnnEHVjuleeY/3x9nFclis2TCyrvK+i8
         M0Tg==
X-Gm-Message-State: AOJu0Yyde3yb7ftj1uOouhumP6TQkHyFRcPA7mQA8/opslUR9uLAf64x
	9os2/Akrx2zEJottJyg6g2yBoFVWWHTMeocISX4=
X-Google-Smtp-Source: AGHT+IFQ3ftjj71bofumSugDReOSuIV01A6ucKV/bnOHEwfEMX9r2jUU4J5QxDXT9RQ/bAfFlBOVIHrSCnrYOglB2kA=
X-Received: by 2002:a05:6512:1597:b0:50e:9357:2ddf with SMTP id
 bp23-20020a056512159700b0050e93572ddfmr765202lfb.17.1704391812044; Thu, 04
 Jan 2024 10:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20240104123420.932-2-jermain.horsman@nedap.com> <20240104123420.932-4-jermain.horsman@nedap.com>
In-Reply-To: <20240104123420.932-4-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jan 2024 19:10:00 +0100
Message-ID: <CANNYZj877Z+AXmhty1Bx-Tv4fw1m=aDSzgiUL3qVF=3tLHtzKQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 2/2] bitbake-layers: Add test case layers setup update
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193333

The test case is fine, lgtm.

Alex

On Thu, 4 Jan 2024 at 13:35, Jermain Horsman <jermain.horsman@nedap.com> wrote:
>
> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> This includes a simple test which creates a layer setup,
> modifies it using a test string and checks if the resulting
> layer setup is written correctly.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  meta/lib/oeqa/selftest/cases/bblayers.py | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
> index 8faa060234..0467fbb736 100644
> --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> @@ -167,3 +167,29 @@ class BitbakeLayers(OESelftestTestCase):
>          oecoredir = os.listdir(testcheckoutdir)[0]
>          testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
>          self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
> +
> +    def test_bitbakelayers_updatelayer(self):
> +        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
> +        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
> +        self.validate_layersjson(jsonfile)
> +
> +        import json
> +        with open(jsonfile) as f:
> +            data = json.load(f)
> +        test_repo = None
> +        for s in data['sources']:
> +            if 'contains_this_file' not in data['sources'][s].keys():
> +                test_repo = s
> +                result = runCmd('bitbake-layers create-layers-setup --update {} --reference {} {}'.format(test_repo, 'remote/test', self.testlayer_path))
> +                break
> +
> +        self.assertTrue(test_repo, "No test repo found")
> +        self.validate_layersjson(jsonfile)
> +
> +        with open(jsonfile) as f:
> +            data = json.load(f)
> +        curr_rev = data['sources'][test_repo]['git-remote']['rev']
> +        curr_desc = data['sources'][test_repo]['git-remote']['describe']
> +
> +        self.assertEqual(curr_rev, 'remote/test', "Revision not set correctly: '{}'".format(curr_rev))
> +        self.assertEqual(curr_desc, '', "Describe not cleared: '{}'".format(curr_desc))
> --
> 2.42.0.windows.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193318): https://lists.openembedded.org/g/openembedded-core/message/193318
> Mute This Topic: https://lists.openembedded.org/mt/103521081/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

