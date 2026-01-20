Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02654D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:15:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4050.1768907720518463963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XEXAgM9l;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a1388cdac3so36032385ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1768907720; x=1769512520; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21Kk14ExijPiW2koN6Icd768N4qXIa+bkskX38N40J8=;
        b=XEXAgM9lHDuzzXNJ11nPTsxZzPEuiT2dB277N2JqMd9HA8KYUbf87u8IdGJbfGUxC7
         FE7YFKzm43YnDe9jVjhKEdqxhHdZoiFCtQkRf1EzRZtfwHHjyjHqQk9nzW4c2iaVnLMU
         gmj4xtOOsRN6UKcp3cYN3gcjkI2c9Mo1HHtGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907720; x=1769512520;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21Kk14ExijPiW2koN6Icd768N4qXIa+bkskX38N40J8=;
        b=lhcgD8U3H2Ei64kzSGLcCwsC71iFLjSXD+DRXMdr3ze9vbTYtZH6FWM9HnqBhFXwiX
         Q0WDKzGnoiKKoEI0N4xcDXm4OoRhzWl1bpqsGED0bTMoBHWG6GoYHzUn10CM8OetckOB
         VNEqMknB79tKagE7gqiwAuF3Hr7T6FCOG+Sd8/OeuwU3WJAp/fDtEXyF2NcauUMhFPbM
         Ty7nWuAwAo5aMJbtBK+te74srUQJoDsvEYZ9PIgPTWiWbAfEa8128//eY3Ar7mcYzm/a
         SdK8mQ4i8spVsRtGlwvS8vEyxotiuEeFiG3ZqPo7QAJdfEr7iTTs+1tm+ty99DtyNONu
         cR8Q==
X-Gm-Message-State: AOJu0YwSNgIpt77hJ/3Whj8ehjxQV+bpP1y6ovcNdT3XJM5oiDctttuZ
	6oaaPSRe2D4qkYlAmvwr/kSGP0TNPeBo5gBQKmmVtmmV8PYQIuormARQXJJNUHqrDhlPIObOTlL
	BJU6u
X-Gm-Gg: AZuq6aJI8I8OGhwdvf/OsZmoUJcK6aPgYRCsYcGLnBE88hGZM7xwifiLChDF33usROY
	QD0U78DIyVWib7EK3KTpcOnsusPzEBQpqvaOWwA9+rSKaaSioFN6BK26k5RKziE/U6inKjtr+xL
	BidbebJaPV5RitY8js4rhCBKcEtlq1joFPRw0KxZguU7wlwLTumY/1lnbey84bwp3HlA+VXIMXM
	80/E1mzEvHXHTAhPikRzZvi8Jc4B9i/jv2EdjEtVF+T2vreYHGFkUG0NbFOePh9Wn1N6LuN+II0
	cqZLNmADHhaw4dqNWJdqcmr4yu5tmLgVfdzo0SRs/m9mhUJ5RspXgDd54twJHufQ55W3y4PQhEh
	A0Ygbqt5QgQ1c28nHewGyzUGzwzdr/bYCFVwbgsjztNs+rp8f1JB35JjaWljpG6e3nE4mMr0MqZ
	UeXRbMBZY+ErI0NfJ+4A==
X-Received: by 2002:a17:903:b4f:b0:2a7:683c:afc6 with SMTP id d9443c01a7336-2a7683cb24dmr16180165ad.39.1768907719844;
        Tue, 20 Jan 2026 03:15:19 -0800 (PST)
Received: from [192.168.1.100] ([150.129.170.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce53fsm123032145ad.30.2026.01.20.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:15:19 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Agn7QsdZEI6Y8GhJBGkTQyhJ"
Message-ID: <c697bb31-f5e9-4360-9264-5ce3e2386b49@mvista.com>
Date: Tue, 20 Jan 2026 16:45:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] curl: fix CVE-2025-10148
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20260107045240.170121-1-hprajapati@mvista.com>
 <256810.1768887388424073608@lists.openembedded.org>
 <CAMSfU+62Kh1t6Be66SnUeL=OEE8JmEhm37qyT1wRy4WGrErwRw@mail.gmail.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <CAMSfU+62Kh1t6Be66SnUeL=OEE8JmEhm37qyT1wRy4WGrErwRw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229659

This is a multi-part message in MIME format.
--------------Agn7QsdZEI6Y8GhJBGkTQyhJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yoann,

Thank you for Quick update.

Regards,

Hitendra

On 20/01/26 2:42 pm, Yoann Congal wrote:
>
>
> Le mar. 20 janv. 2026 à 06:36, Hitendra Prajapati via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <hprajapati=mvista.com@lists.openembedded.org> a écrit :
>
>     Hi Team,
>     Any update on this ?
>
>
> Hello,
>
> I'm currently focussed on getting Kirkstone 4.0.33 built. And, while I 
> will send a scarthgap patch series soon, this one is not included, sorry.
> It does look good. I will definitely consider it for the next scartgap 
> release (5.0.16 built on 2026-02-09).
>
> Regards,
>
>     Regards,
>     Hitendra
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#229643):
>     https://lists.openembedded.org/g/openembedded-core/message/229643
>     Mute This Topic: https://lists.openembedded.org/mt/117129750/4316185
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [yoann.congal@smile.fr]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Yoann Congal
> Smile ECS
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------Agn7QsdZEI6Y8GhJBGkTQyhJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <p>Thank you for Quick update. <br>
    </p>
    <p>Regards,</p>
    <p>Hitendra<font size="2"><br>
      </font></p>
    <div class="moz-cite-prefix">On 20/01/26 2:42 pm, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMSfU+62Kh1t6Be66SnUeL=OEE8JmEhm37qyT1wRy4WGrErwRw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">Le mar. 20 janv. 2026
            à 06:36, Hitendra Prajapati via <a
              href="http://lists.openembedded.org"
              moz-do-not-send="true">lists.openembedded.org</a>
            &lt;hprajapati=<a
              href="mailto:mvista.com@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">mvista.com@lists.openembedded.org</a>&gt;
            a écrit :<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>Hi Team,</div>
            <div>Any update on this ?</div>
          </blockquote>
          <div><br>
          </div>
          <div>Hello,</div>
          <div><br>
          </div>
          <div>I'm currently focussed on getting Kirkstone 4.0.33
            built. And, while I will send a scarthgap patch series soon,
            this one is not included, sorry.</div>
          <div>It does look good. I will definitely consider it for the
            next scartgap release (5.0.16 built on 2026-02-09).</div>
          <div><br>
          </div>
          <div>Regards,</div>
          <div> </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> </div>
            <div>Regards,</div>
            <div>Hitendra</div>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#229643): <a
href="https://lists.openembedded.org/g/openembedded-core/message/229643"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/message/229643</a><br>
            Mute This Topic: <a
              href="https://lists.openembedded.org/mt/117129750/4316185"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/mt/117129750/4316185</a><br>
            Group Owner: <a
href="mailto:openembedded-core%2Bowner@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-core/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href="mailto:yoann.congal@smile.fr" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">yoann.congal@smile.fr</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear="all">
        </div>
        <br>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr"><font face="Raleway, regular">Yoann Congal</font>
            <div><font face="Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------Agn7QsdZEI6Y8GhJBGkTQyhJ--

