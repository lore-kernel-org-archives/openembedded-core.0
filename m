Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65197C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:07:51 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3561.1784531264846653156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dbfnrl7l;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso8107969a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784531264; x=1785136064; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VX7as/WFplUgFh7slGk6W1aiqLlvwgI2yKy1wBSOLs=;
        b=dbfnrl7lElHs8QH6f0mbGqcriK22nwKFanZWnMF7vc6L/RiNEwXd4P2E924vGqrEw4
         5YNzCX56J8rMFJ4MRK/voCK6ueCI6bLSgVkE2f9hByFBNZMwICyWKfdEIoE/I85MAV0T
         vJyLTl7YKDZ961oFP1nG93Uuv4xGBTwtQbmYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531264; x=1785136064;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VX7as/WFplUgFh7slGk6W1aiqLlvwgI2yKy1wBSOLs=;
        b=PRSrspEAoT56yucRYz1li/cy7c3ME9zYwX4iI9qBBGcClm+aewJiRylDyLStoFVd9O
         +s2KMxMV0plAFyNe/pEmevep8hvAMs+ZL5zYRB4fwB4iSHQ3BUqOh28xHRjux1cfKIgU
         bY7frTmWTdA7mtW8Xs4DOPMEAybAQJAEr+8ZGe9k7VHzl231pmj70xUJiUeKG1vh2g+8
         dJgm4RzGzrOn5FB9J75GG7mjkA6EQ8IMKQychrugzcwwySsbeB+pxLG+1MnKp7K6v8Xf
         18IvW7fpZl8UW52qfjNT0GgfpIiXGoiYmWqbIBtV7vymjItP2gulhBfDhHKllT2ZV1mH
         d3rA==
X-Forwarded-Encrypted: i=1; AHgh+RqcCse9/4gwcZxh4x9TwfPSACe/r08N0FAPnA0goREuslVYaRLL7PwycSA+GlpvmGuSJfO6vK2aj4QihuE3ZquNQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPZaHloTfQPnS35E6d0H89hFpdwZIiqR9FxINFBwHDmRrpftQu
	SV5kX4qUwkYqwXQskz38rFH3UBJ5mnbiwQOo29Xxk6aaO3PHSTdEotTKdC/leXbGB+w=
X-Gm-Gg: AfdE7cmrmV8/b4DcXS/EDuCIMCNiBzSWGEcWqzvA9F/W/H9sRq9FnXlgpN623s0K2rt
	QRmLq38kGciNu+93no3rP1/DSQdyI7TeWd9yMmkbepSTtRN+v5B8JgY4vX/pY0B3Tq7N81Ddodg
	sq9hNvJBYxQV7IBIfzOxb9/n8spAeyaen/AWka6WRkm8fGOdopBAolA5hjiXRx0+bdPcPMwd43g
	LtOUJpT0JDzsUFZ98Cl0+3jovfdkxNOAGt7J1O/grfuPAxCw7fsFOOPMYi+zipioeRmsjFJb4tL
	20KEBX/hlrDupJONEkC0j0eb8fnJpGEylv4Cx0fcswIZZEFpR6+WXGOW5oroFFOW/ThrpA+iCNs
	75h7BPhu2ztkAjbvIKrzFS72taszxtH5N8fkFts3QA5bCW5DNkNrFjs52A/E3GuLNcRkGuDZDYr
	SbTiQNCqbJ
X-Received: by 2002:a05:6a21:b94:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3c3ad7d7fc8mr14300415637.21.1784531263906;
        Mon, 20 Jul 2026 00:07:43 -0700 (PDT)
Received: from [192.168.0.102] ([150.129.170.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb65bsm4229293a12.15.2026.07.20.00.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:07:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7v0kGJ3OiDo3ILRPeEjugfqJ"
Message-ID: <a5ed59fd-25b7-47d1-99b4-3294f005ed36@mvista.com>
Date: Mon, 20 Jul 2026 12:37:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260625125532.185380-1-hprajapati@mvista.com>
 <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr> <DK2N06S7DNIU.3NHYH9RB4Q2DZ@smile.fr>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <DK2N06S7DNIU.3NHYH9RB4Q2DZ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241328

This is a multi-part message in MIME format.
--------------7v0kGJ3OiDo3ILRPeEjugfqJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Team,

patch share for wrynose layer.

Regards,

Hitendra

On 19/07/26 8:32 pm, Yoann Congal wrote:
> On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
>> On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openembedded.org wrote:
>>> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>>>
>>> [1]https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83
>>> [2]https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84
>>> [3]https://security-tracker.debian.org/tracker/CVE-2026-42011
>>> [4]https://gitlab.com/gnutls/gnutls/-/work_items/1824
>>>
>>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> ---
>> As far as I know, this fix is also needed on wrynose:
>> CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynose has 3.8.12.
>>
>> Can you send a fix for wrynose so I can take this one for scarthgap?
>>
>> Thanks!
> Gentle ping for the above
>
> Regards,
-- 
Regards,
Hitendra Prajapati
Sr. Software Engineer
MontaVista Software LLC
Mo: +91 9998906483
--------------7v0kGJ3OiDo3ILRPeEjugfqJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Team,</p>
    <p>patch share for wrynose layer.<br>
    </p>
    <p>Regards,</p>
    <p>Hitendra<font size="2"><br>
      </font></p>
    <div class="moz-cite-prefix">On 19/07/26 8:32 pm, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:DK2N06S7DNIU.3NHYH9RB4Q2DZ@smile.fr">
      <pre class="moz-quote-pre" wrap="">On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Pick patch from [1] &amp; [2] also mentioned at Debian report in [3]

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83">https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84">https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84</a>
[3] <a class="moz-txt-link-freetext" href="https://security-tracker.debian.org/tracker/CVE-2026-42011">https://security-tracker.debian.org/tracker/CVE-2026-42011</a>
[4] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/work_items/1824">https://gitlab.com/gnutls/gnutls/-/work_items/1824</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
As far as I know, this fix is also needed on wrynose:
CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynose has 3.8.12.

Can you send a fix for wrynose so I can take this one for scarthgap?

Thanks!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Gentle ping for the above

Regards,
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        Sr. Software Engineer<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------7v0kGJ3OiDo3ILRPeEjugfqJ--

