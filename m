Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8330.1609344351572850249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 08:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JV90r6iC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t16so17829425wra.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aJ6VjuZ8kYmLisMwuhMVYqcbYWHs8NZsfAvfGRdC4ko=;
        b=JV90r6iCmFWrmyEl/DVIngBw87XZDniJ5Iayodt581jqWmG2WmwgOLD82xy3geue4d
         7i4E4JWWB6TPb4/8uV4pSieLuD4w6lUxX2jZS6o92SH+OOZ2hcJ21i3cvoV3fRjRvVoX
         6DEwkorUAxM3NiE0d70DAD7MiifVKDGWzCvPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aJ6VjuZ8kYmLisMwuhMVYqcbYWHs8NZsfAvfGRdC4ko=;
        b=O2NgtTTJB1cWi2ABbLKuH6/ENsdj7e1doUSTU/zKDd5AHQYZJ4WNu9Tuo8j289dPJJ
         xiyH4haUlZWGuPWmMEQJZNjj5P06t2riMjeOt8wjXHl3X1JG8Bd9oKhaWa3x+QwyeS6p
         zsXAP2LwX5oAtoVvh961WwiEXq/yPlbHzMbhNml6GbbgymG5S8RU98Lcz2RSD+eoSg37
         8mGcma8RyXThTWJB1YJ1lS8+HsJ88bPQBZ13qa2VtpOhFo0neuouWGzOXrfTINvpphZe
         nK13TFQ1gBBhm3wMaolIQ+/LUxc6cVR7X9ug/uz9lYS/noGJS9JQb9FpjiHSnl5YKpe+
         5YRg==
X-Gm-Message-State: AOAM531VvGtKtm+xng1lV6eW84CSzYtNvAv+VBTBruIlc9FMUn2LfTkK
	q4UjsUZo4nTVcFQewKbayYQOug==
X-Google-Smtp-Source: ABdhPJzM2rE4I3W2NUwmszrRu19mI8yiydmnv7Xod7eYkXT6hADxj+n4OqCgcdWjhdIv3t92RUOdbw==
X-Received: by 2002:adf:b359:: with SMTP id k25mr61785921wrd.98.1609344350087;
        Wed, 30 Dec 2020 08:05:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id m21sm7583765wml.13.2020.12.30.08.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 08:05:49 -0800 (PST)
Message-ID: <e392eb99f3d142698d2485cb4c31395048f07186.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic/direct/ksparser: ensure fsuuid for vfat and msdos align with format
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Lee Chee Yang <chee.yang.lee@intel.com>, 
	openembedded-core@lists.openembedded.org, Naveen Saini
	 <naveen.kumar.saini@intel.com>
Date: Wed, 30 Dec 2020 16:05:47 +0000
In-Reply-To: <20201230061703.84078-1-chee.yang.lee@intel.com>
References: <20201230061703.84078-1-chee.yang.lee@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-30 at 14:17 +0800, Lee Chee Yang wrote:
From: Lee Chee Yang <chee.yang.lee@intel.com>

vfat/msdos filesystem should have fsuuid in format 0xYYYYYYYY where
"0x"
in front follow with 8 hexadecimal number in uppercase. In wic, when
using
custom fsuuid for vfat/msdos partition in wks, it is able to set the
value
in any length, with or without leading "0x". This can cause fsuuid
missaligned when fstab updates, fstab expect exactly 10 character
fsuuid for vfat/msdos partition and all in uppercase.

if custom fsuuid for vfat/msdos is set, check the length and format,
error if it exceed the format size. Amend it so it is align with format
0xYYYYYYYY. This is done before image create and fstab update to ensure
the
fsuuid are same in all followup process. if custom fsuuid length less
than
expected, fill in "0".

[yocto #14161]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

There is something not quite right in this change:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/3109

Cheers,

Richard

