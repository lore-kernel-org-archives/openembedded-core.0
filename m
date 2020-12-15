Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.4404.1608069919990372487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 14:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0BFM5B8D013668
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 15 Dec 2020 16:05:12 -0600
Subject: Re: [OE-core] How to create a directory in multiple packages?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
 <6df31263-e880-19a8-10ed-7ec6a8a2b5ba@kernel.crashing.org>
 <503f4c44699844c588fe68cd6e45296b@XBOX03.axis.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <078116fd-c32b-773e-a821-ea9512b2f57c@kernel.crashing.org>
Date: Tue, 15 Dec 2020 16:05:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <503f4c44699844c588fe68cd6e45296b@XBOX03.axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/15/20 8:24 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Mark Hatle
>> Sent: den 15 december 2020 02:02
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] How to create a directory in multiple packages?
>>
>> On 12/14/20 11:43 AM, Peter Kjellerstedt wrote:
>>> Say we have a recipe that creates an empty /etc/foo directory. Now we
>>> want to add a new file in that directory /etc/foo/bar and package it as
>>> ${PN}-bar. This means the creation of the /etc/foo directory is moved
>>> from the ${PN} package to the ${PN}-bar package. Is there any way to
>>> make ${PN} continue to create an empty /etc/foo, or is the only
>>> alternative to introduce an /etc/foo/.dummy and package it in ${PN}?
>>
>> try adjust the order of the PACKAGES variant.  Something like:
>>
>> PACKAGES = "${PN}-bar ... ${PN}"
>>
>> FILES_${PN}-bar = "/etc/foo/bar"
>> FILES_${PN} = "/etc/foo"
>>
>> That SHOULD package the file 'bar' in -bar, and the directory in ${PN}.
> 
> Unfortunately that does not work (seems bitbake is too smart). What I have 
> is basically:
> 
> PACKAGE_BEFORE_PN = "${PN}-bar"
> FILES_${PN} += "${sysconfdir}/foo"
> FILES_${PN}-bar = "${sysconfdir}/foo/bar"
> 
> which results in the following in the spec file:
> 
> %files -n foo-bar
> %defattr(-,-,-,-)
> %dir "/etc"
> %dir "/etc/foo"
> "/etc/foo/bar"
> 
> There is nothing else about /etc or /etc/foo in the spec file.

Ya, there definitely should be a way to do this...  If not, it will be
problematic as more or more recipes get split into smaller chunks.

> After delving into the code for at bit, I believe this is due to how 
> populate_packages() works. When it handles the ${PN}-bar package and 
> finds the /etc/foo/bar file, it will also mark /etc and /etc/foo as  
> seen, which means they will not be added to any other package, unless 
> that package has an entry for some other /etc/foo/something file, even 
> if /etc/foo is explicitly listed in, e.g., FILES_${PN}.
> 
> So for now, it seems we will have to resort to using a pkg_postinst_${PN}.

Big problem with pkg_postinst, the system won't be able to track
perms/owner/group for the directory and ensure they are synced like the package
manager itself can.

For RPM, I know the %dir directive can (and should be) used to do this kind of
thing, but I don't know what the equivalencies are in opkg and deb.  If there is
a similar mechanism there to specify a directory (not not it's contents) then I
suspect may want to extend recipe syntax to match.

--Mark

>> (Some of the people commenting this isn't less then optimal, actually
>> it's not that unusual.. Typical case I see is creating a directory in 
>> /var or /usr/share for datafiles and the main package owns the directory, 
>> with sub-packages [or other packages] contributing data into that 
>> directory.)
> 
> Yes, there are reason why the empty directory needs to be installed as 
> part of the image. Otherwise I would just have used a file in 
> "/usr/lib/tmpfiles.d".
> 
>> --Mark
>>
>>> //Peter
> 
> //Peter
> 
> 
> 
> 
> 
