Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5736E7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 01:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1K1W1I8007843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 17:32:02 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 19 Feb 2014 17:32:01 -0800
Message-ID: <53055B16.7090004@windriver.com>
Date: Thu, 20 Feb 2014 09:32:06 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1392807566-15114-1-git-send-email-kai.kang@windriver.com>
	<1392810188.14769.356.camel@phil-desktop.brightsign>
In-Reply-To: <1392810188.14769.356.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d.bbclass: fix inhibit check
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
X-List-Received-Date: Thu, 20 Feb 2014 01:32:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年02月19日 19:43, Phil Blundell wrote:
> On Wed, 2014-02-19 at 18:59 +0800, Kai Kang wrote:
>> In update-rc.d.bbclass it checks variable INITSCRIPT_PACKAGES to avoid
>> inherit this class. But it is wrong logic to check INITSCRIPT_PACKAGES.
>> When 'sysvinit' is in 'DISTRO_FEATURES', INITSCRIPT_PACKAGES will not be
>> checked.
> Er, really?  From the code you quoted...
>
>>       # Check that this class isn't being inhibited (generally, by
>>       # systemd.bbclass) before doing any work.
>> -    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
>> +    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
>>          not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
>>           pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
>>           if pkgs == None:
> ... it seems that if sysvinit is in DISTRO_FEATURES then the outer "if"
> will evaluate to true and it will indeed proceed to check
> INITSCRIPT_PACKAGES in the last quoted line.  Can you clarify what
> exactly is wrong here?

Sorry, as laurentiu comments, it is INHIBIT_UPDATERCD_BBCLASS which 
variable will not be checked.

I'll update the comment with V2.

Regards,
Kai

>
> p.
>
>
>
>


-- 
Regards,
Neil | Kai Kang


