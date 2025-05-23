Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C0C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:41:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.44652.1747993287009586424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ecpw1L2Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441c99459e9so59269415e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 02:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993285; x=1748598085; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C5RCLTVKweqVbXma+/l5+xIfwGCMPUgYyLPaDRueRxk=;
        b=Ecpw1L2Q578jRFXTXvhI2SESw6FLakjZEZwLUlRwY0NuOod053hPN4Uvn3CzxABiDC
         9x2WCDUOLEdUiXQNU9tXmVMBm23vwavU/gixa1ZACgoDGRhirUl+DD0e6Lx3W8y1OBuF
         B0Nmiw4nx33qhIXWEQ55GzfoDZMyT0DU0sA6HtwoJIhYTbr5ZmfEe18tYbkf/goSpZ/l
         wRan6XVNZRJk2VIxTlV1/qpPErwI4HXEaSzbfvNVrMP9RAYIuYvCpbzOlmC1Ca6Ojwcq
         u0WcrBuppT8mlH2vHlkO4Knsm4mM8rvAhiz1lu9T6CbN3vWCF4S/94k38Vgzt5VsgQek
         Vkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993285; x=1748598085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5RCLTVKweqVbXma+/l5+xIfwGCMPUgYyLPaDRueRxk=;
        b=r7wmiM7jkMV3T5NA9QqqOTqMhtSiFkfmOfmCqzi2SXZNNN2WoO9W8tKc9rOzQ/ZqWu
         mOwNvJ645xMXSfjEgyZxc7tlJoeVSBlfdHFwOUImQsXmjHatf+iMxfjXfHhKvdNswWoe
         8KprsXQisEe0tPMcOhnXXvw2vFOzkF5Onx5Gtx1bjdGRyGzW0HtVzy6ajpIoyKux8Bjb
         ITZxLWWsVmdBquY3AbzifpMwMPtttspZV4f36EUgNgHwumLzmLrSvhQxWMdiMPKJP9Im
         hb1ngB4uoZW1hyZOBaXENJqwUbenXQKVzntYMwRJrUaIuixPuUaa+6asnmtqp9Rs3x0A
         vluA==
X-Forwarded-Encrypted: i=1; AJvYcCW5+GiYd9xh6X9HLorLIHi3zV9OhAfFD8VUH9wYKOMKz2P8JswICf0liKaKebGxPv8qaRbW8YLs5wRAvjN5afwFQg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxaAv6jyu3GPS7R+ZGzewc0BDkr1PfWFoxBYRMOXpzFjW7pHiqO
	M3lqXRzmCiDR88Wlq+nV3ufAucc2w+sVP5uysmKlIu5lNXkSdv6pmd3d
X-Gm-Gg: ASbGncu0muQ0B/Ca/1gkzjlxSfQ7e0RcN3bQwpljVRN5kbmOdeXq0GhjgxXwEJvgOaH
	XGC4HhhcDsDhkx6/rLU5kkNFlm8EtY3xQzF2R+UBMLPsZ1dNADpe8N0WLN9dHokqaq9oKNkSI5r
	BGqGxKdEXNJ+cSSMNGuvVCpECxsBOmLo1lkJTWzdHNTIRGpk2oCRtn+wNRm++cFAPhpRUjE9aIU
	wJM9Tu5nF1LKZYIWdQ09Io5I+2Fg2P1DoXyah8HQXdZr0jyohVAzMgBS0DlvRpVIMBHvxuLCrNG
	UDx+tyR231Z0rWIJw+Rmv2H9lXBRtdYqYK4zNDF6uWUHqx61hXzoLgeFOjg0NcQ2sMfUtw==
X-Google-Smtp-Source: AGHT+IG9S/bfwMF7Sfslrh+pG3Z/vqAmksQWAC6jC8CwJDJlv81eyFrsAvWiZpugKhn0M+RJTJF1GQ==
X-Received: by 2002:a05:6000:2504:b0:3a3:6dc6:4bbb with SMTP id ffacd0b85a97d-3a36dc64d82mr17956493f8f.58.1747993285068;
        Fri, 23 May 2025 02:41:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a360b0b766sm25720633f8f.56.2025.05.23.02.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:41:24 -0700 (PDT)
Message-ID: <f48d6366-07bf-442c-8d2f-96a826faf946@gmail.com>
Date: Fri, 23 May 2025 11:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] ca-certificates: postinst shift count out of range
 error
To: WXbet@proton.me, openembedded-core@lists.openembedded.org
References: <HrS5.1747939211095331723.J22A@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <HrS5.1747939211095331723.J22A@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217183

On 5/22/25 20:40, WXbet via lists.openembedded.org wrote:
> We see the following error maybe introduced with commit
> ca-certificates: submit sysroot patch upstream, drop default-sysroot.…
> · openembedded/openembedded-core@90d9f0b
> <https://github.com/openembedded/openembedded-core/commit/90d9f0ba674d4fe8e9291f0513c13dff3775c545#diff-fea5ef51cd53e027c02d43f853be31c492bdbe8de48cfbe268bb6b1bcad5f162>
>
> Configuring ca-certificates.
> /usr/sbin/update-ca-certificates: line 75: shift: shift count out of range
> error: pkg_run_script: package "ca-certificates" postinst script
> returned status 1.
> error: opkg_configure: ca-certificates.postinst returned 1.
>  
>
> The postinst part in ipkg looks like:
> set -e
>     $D/usr/sbin/update-ca-certificates --sysroot $D
>
> Created from:
> https://github.com/openembedded/openembedded-core/commit/90d9f0ba674d4fe8e9291f0513c13dff3775c545#diff-d521676128cddb868864b5c8355a22f3245674db0e721c3458f7c35681ebd712R64-R65
> Parameter $D is empty and so the shift-command fails.
>
> Looks like there is a missing slash at the end of
> `$D${sbindir}/update-ca-certificates --sysroot $D`

I think it should be either the slash at the end, of maybe something
like this:

[ -n "$D" ] && sysroot_args="--sysroot $D"
$D${sbindir}/update-ca-certificates $sysroot_args

To me, the below conditional shifting seems a bit like hiding a user error.

>  
> or
>  
> the shift error in update-ca-certificates could be avoided with a
> patch like this:
>
> diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
> index 91d8024..0122c99 100755
> --- a/sbin/update-ca-certificates
> +++ b/sbin/update-ca-certificates
> @@ -71,7 +71,7 @@ do
>        echo "$0: [--verbose] [--fresh]"
>        exit;;
>    esac
> -  shift
> +  [ $# -gt 0 ] && shift
>  done
>  
>  if [ ! -s "$CERTSCONF" ]
>
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217144): https://lists.openembedded.org/g/openembedded-core/message/217144
> Mute This Topic: https://lists.openembedded.org/mt/113252836/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


