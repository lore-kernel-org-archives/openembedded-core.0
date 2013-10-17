Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1426CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9HB6DTb022293
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Oct 2013 04:06:13 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 17 Oct 2013 04:06:12 -0700
Message-ID: <525FC4A0.30200@windriver.com>
Date: Thu, 17 Oct 2013 19:06:08 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>, Martin Jansa <martin.jansa@gmail.com>
References: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
	<1382004192-12678-2-git-send-email-ming.liu@windriver.com>
	<1382004711.484.47.camel@phil-desktop.brightsign>
	<525FBBBA.3000405@windriver.com>
	<1382007212.484.53.camel@phil-desktop.brightsign>
In-Reply-To: <1382007212.484.53.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 11:06:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 06:53 PM, Phil Blundell wrote:
> On Thu, 2013-10-17 at 18:28 +0800, Ming Liu wrote:
>> On 10/17/2013 06:11 PM, Phil Blundell wrote:
>>> On Thu, 2013-10-17 at 18:03 +0800, Ming Liu wrote:
>>>> +pkg_postinst_${PN} () {
>>>> +	touch $D${sysconfdir}/shells
>>>> +	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
>>>> +}
>>> Is that "touch" really desirable?  It seems as though screen ought not
>>> really to be creating /etc/shells if it isn't there already,
>> No, it's supposed to be created if /etc/shells doesn't exist already,
>> otherwise, how could we echo text to it?
> I guess there are two things to say about this:
>
> 1) not everybody wants /etc/shells, and having screen (or any other
> recipe) create that file unilaterally seems like a bad thing.
> Especially since there doesn't seem to be any corresponding postrm to
> clear it up if screen is then removed again, nor is /etc/shells
> mentioned in CONFFILES.
>
> 2) even if you did want to create /etc/shells, the touch is unnecessary
> because "echo foo >> FILE" is perfectly capable of creating the FILE if
> it didn't already exist.
Yes, you are correct for both of the two points, I will send the V3, 
includes the changes:
1 add postrm script, removing the entry in /etc/shells.
2 rm the unnecessary 'touch'.
3 change the regex for screen and bash recipes.(As Martin pointed out)

Anything else?

//Ming Liu
>
> p.
>
>
>
>


