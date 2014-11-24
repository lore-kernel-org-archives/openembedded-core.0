Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D400865DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 08:50:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAO8o8al027123
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 00:50:08 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 24 Nov 2014 00:50:07 -0800
Message-ID: <5472F13D.3070302@windriver.com>
Date: Mon, 24 Nov 2014 16:50:05 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
	<1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
	<20141027085931.GA27393@ad.chargestorm.se>
	<544E0F53.3010600@windriver.com>
	<20141112115929.GA13790@ad.chargestorm.se>
In-Reply-To: <20141112115929.GA13790@ad.chargestorm.se>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] systemd: add bash to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Nov 2014 08:50:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/12/2014 07:59 PM, Anders Darander wrote:
> * Chong Lu <Chong.Lu@windriver.com> [141027 10:24]:
>> On 10/27/2014 04:59 PM, Anders Darander wrote:
>>> * Chong Lu <Chong.Lu@windriver.com> [141027 08:19]:
>>>> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash,
>>>> but no providers in its RDEPENDS [file-rdeps]
>>> How much bashisms are it in the files in systemd-kernel-install?
>>> Would it be possible to to patch the scripts to use standard posixh sh
>>> instead of bash?
>> It has lots of bashisms:
>> $ checkbashisms ./usr/bin/kernel-install
>> possible bashism in ./usr/bin/kernel-install line 32 (local -opt):
>>       local -a files
>> possible bashism in ./usr/bin/kernel-install line 35 (readarray):
>>       readarray -t files < <(
> This one, readarray, might require some thought on how to make it
> standard posix sh compatible...
>
>> possible bashism in ./usr/bin/kernel-install line 38 (alternative test
>> command ([[ foo ]] should be [ foo ])):
>>                   if [[ -e "$i" ]]; then
> There's quite a few of these, that are easy to patch and upstream.
>
>> possible bashism in ./usr/bin/kernel-install line 58 (should be 'b = a'):
>>       if [ "$i" == "--help" -o "$i" == "-h" ]; then
> Dito for these.
>
>> possible bashism in ./usr/bin/kernel-install line 113 ('((' should be
>> '$(('):
>>                   ((ret+=$?))
> Likely dito.
>
> So in summary, a large number of bashisms in kernel-install are easy to
> fix.
>
> Then there's a few that's a lot harder, all of these are using arrays
> and readarray.
>
> It would have been nice to see such a summary instead of only the rather
> long report. If we can find another way to implement the code using
> arrays, the complete patch should be upstreamable.

Yes, some bashisms about array in kernel-install and 
90-loaderentry.install script.
But it is painful to fix them. The systemd-kernel-install is a sub 
package and it isn't installed by default.
It doesn't impact image size when we add bash dependency to 
systemd-kernel-install.
If you don't agree add bash dependency, we just get a warning about 
file-rdeps.

Best Regards
Chong

>
> I'm currently not using kernel-install in any system, thus, due to
> workload, I'm not going to be able to look into this at the moment.
>
> Cheers,
> Anders


