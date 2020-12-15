Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.3931.1607994100179034925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 17:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0BF11bkS009382
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 19:01:38 -0600
Subject: Re: [OE-core] How to create a directory in multiple packages?
To: openembedded-core@lists.openembedded.org
References: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <6df31263-e880-19a8-10ed-7ec6a8a2b5ba@kernel.crashing.org>
Date: Mon, 14 Dec 2020 19:01:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/14/20 11:43 AM, Peter Kjellerstedt wrote:
> Say we have a recipe that creates an empty /etc/foo directory. Now we 
> want to add a new file in that directory /etc/foo/bar and package it as 
> ${PN}-bar. This means the creation of the /etc/foo directory is moved 
> from the ${PN} package to the ${PN}-bar package. Is there any way to 
> make ${PN} continue to create an empty /etc/foo, or is the only 
> alternative to introduce an /etc/foo/.dummy and package it in ${PN}?

try adjust the order of the PACKAGES variant.  Something like:

PACKAGES = "${PN}-bar ... ${PN}"

FILES_${PN}-bar = "/etc/foo/bar"
FILES_${PN} = "/etc/foo"

That SHOULD package the file 'bar' in -bar, and the directory in ${PN}.

(Some of the people commenting this isn't less then optimal, actually it's not
that unusual.. Typical case I see is creating a directory in /var or /usr/share
for datafiles and the main package owns the directory, with sub-packages [or
other packages] contributing data into that directory.)

--Mark

> //Peter
> 
> 
> 
> 
> 
