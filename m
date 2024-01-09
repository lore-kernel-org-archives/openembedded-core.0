Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA98CC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 10:27:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.13783.1704796024458496346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 02:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HR8x083f;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso2737352e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 02:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704796022; x=1705400822; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pnYTyo2LIdXSpWUc1aA8Q9RNYnVUcWuGxfhINntotZ4=;
        b=HR8x083fxcxEyQy9UhzLmobfCt8WioJ0FqkwfZ/HEV6AkglXLGmicWL28xJRgLuo58
         BYCcoYdixk1iKsjz32qJTUM9W7leFnE36bwwjoiPY5hw+khBtcJS1lPMVal6I3U7Yxfx
         Bxingau1cywuC/QYLAvUFaPryobGsU6mdlUWkMSTA+oMj/i57EstcV1k+Qpf2tc34vYB
         NJGcRk2ldDOCH0x3wXn3mA1dSkZL9wjwIHzVJZbxLaYvJdjKXhYziJXmZUPKNrRo6oip
         /O5W+cdtQLW/xvyFb2cyWjTA1h1KdFQ41AqAwhfOIY5NFDGPXID50d4JWorJCgp2Iqju
         6PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796022; x=1705400822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnYTyo2LIdXSpWUc1aA8Q9RNYnVUcWuGxfhINntotZ4=;
        b=QRsrHD1shgjgBITCZze/HtYKwn/h9DAQ7HGmj9tgiwr2v5hwgXOp0EWiAe3ADuoi0S
         c422hOFNV05nufmHY8ogycYa10Oj9y01b0yf5gxXAZcc44cAwRn/1PUv3Hs50MzJ7khw
         Y9fjQ+e2DNQhqazUWjn0mA/22VolmFMunOuLMPCP1yzvnT7S+/j4SvhE+4QoYRFhJusY
         VAkk7r5y1gCxgd+TpUdKwDsVUiqLStWWrn8qcPpIDNtYn0zGPWu6d29zj8s2IvXpcqow
         OlnzxkREwdsF6Ym0aRggNvS+pAbJ2VSh5GbUcNjGN25/PqoPvppXZ/hHtjg3IaVRNLbl
         vgvQ==
X-Gm-Message-State: AOJu0YzA28QpG+/CHoOQBEQP3iQKI09M1eOYw1R/vCNiOzc7ey2optwZ
	YIfKfC5WBNXbX3e0Cfg0xRzAr9+tioyatn1hbx8=
X-Google-Smtp-Source: AGHT+IG/PS3aGPvM9M1pBWtoPlEza90DQ57GxBkJGE560fPidvP9VxOdo6hzOGVDQqfsfswMIrvibcWZZRs/VnhxLvI=
X-Received: by 2002:a05:6512:3d0d:b0:50e:c798:699c with SMTP id
 d13-20020a0565123d0d00b0050ec798699cmr1145855lfv.37.1704796022097; Tue, 09
 Jan 2024 02:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20240108143857.2316-2-jermain.horsman@nedap.com> <20240108143857.2316-6-jermain.horsman@nedap.com>
In-Reply-To: <20240108143857.2316-6-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 11:26:50 +0100
Message-ID: <CANNYZj-TeZGDw4PRWTiWQgo-NWm6J6_o3aNKYfjdp4BHevZc_Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC v3 2/2] bitbake-layers: Add test case layers setup update
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193450

The test should be doing this sequence:

1. Write a new json file with two different custom references (if we
go with --use-custom-reference repo,reference).
2. Check that both custom references are written correctly.
3. Use --update to update one of the custom references but not the other.
4. Check that one custom reference was updated, but the other was not.

Alex


On Mon, 8 Jan 2024 at 15:42, Jermain Horsman <jermain.horsman@nedap.com> wrote:
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
> index 8faa060234..f07fbd46fb 100644
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
> +                result = runCmd('bitbake-layers create-layers-setup --update --repository {} --reference {} {}'.format(test_repo, 'remote/test', self.testlayer_path))
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
> View/Reply Online (#193409): https://lists.openembedded.org/g/openembedded-core/message/193409
> Mute This Topic: https://lists.openembedded.org/mt/103598120/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

