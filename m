Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.6801.1610443792613989365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aWtwdHWY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t30so1734727wrb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9YxqycHypmLDgpDqJzBc9HE9WKi3GyaOlezSg98Sovg=;
        b=aWtwdHWYkP6w5D2zeL/JYYFnVghtifzmovLnxfGk+7QIokCeuisOtn/Sd/N6zYHoIV
         fn50c6913BXefXjvPN1eP6+8HzN+oVr5C9C253ZZ9PHR1ini6HKHIL+wh3twovTe2bRJ
         OGvmuGIA0aQiSVNyzGjKPyzSEGbNezfEKifBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9YxqycHypmLDgpDqJzBc9HE9WKi3GyaOlezSg98Sovg=;
        b=dh32Hq4x2QrjwtfPoFHR5EhdJEd8yh32coxDH09mX5aMmkrRiqWiu7KbUteiax4ZAC
         azhPqt/YDzX+vqjf/JHytZeS7p9QPEAFCPmUBGuxurp/cEoScYn3nuHqv5/YCNCeXnAa
         GdK2V3kSTscLNVNPtY5zUJjcyjTPEAhEehYustzg2F1wxm84ySgMxlgkmimI01uwmsfV
         7zy9TZNzVZev+tYKdO1gbVVOfn5rjym45xWrOpxpwBVVNQNaQMkUltOjKXyI8PByetFD
         CL2CCUj+88JvnTFQDMjGlY1zkgysloy+qkl4kpTyfQHEurAXouJ0j/++RrhSOIttjV2a
         VhcQ==
X-Gm-Message-State: AOAM5310chC6psUhBnzV/MsKOzrop4C99qce5supKC1ththKtyMXd1c+
	/unM8qQNf+TqkstC6qR6Lk8lSA==
X-Google-Smtp-Source: ABdhPJxjglpmLPEbOsU7rEZ+7/9iTlLfJKyPkFG0DtgbJbqa89XM89xKQxfl3vCAfX2GNA/FHj/6QA==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr3331167wro.97.1610443791147;
        Tue, 12 Jan 2021 01:29:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id o14sm266909wri.48.2021.01.12.01.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:29:50 -0800 (PST)
Message-ID: <4835fbae4a7172d0a6cf807b732f5ba8220c190d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jan 2021 09:29:49 +0000
In-Reply-To: <1daa7957-d969-1db0-9bd6-83304c74a46c@windriver.com>
References: <20210107095630.32609-1-mingli.yu@windriver.com>
	 <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
	 <CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0@CO1PR11MB5009.namprd11.prod.outlook.com>
	 <56862538e3b73683149fcba749ea5dfcedd26012.camel@linuxfoundation.org>
	 <1daa7957-d969-1db0-9bd6-83304c74a46c@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-12 at 15:42 +0800, Yu, Mingli wrote:
> Hi RP,
> 
> On 1/8/21 4:52 PM, Richard Purdie wrote:
> > On Fri, 2021-01-08 at 08:40 +0000, Yu, Mingli wrote:
> > > This is just configuration change which defines the absolute path for
> > > the command to silence the warning when systemd-analyze verify the
> > > unit files and the command may be installed in different place
> > > between OE and non-OE, so it should be OE specific, will resend v2 to
> > > mark it is configuration specific.
> > 
> > Why wouldn't systemd-analyze show warnings for upstream too though?
> 
> I also checked the service file on other linux distribution such as 
> Ubuntu and it also use the absolute path.

Do they carry patches to systemd to do that?

Cheers,

Richard

