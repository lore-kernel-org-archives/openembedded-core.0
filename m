Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E61D1702A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:07:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s67A7T2c027581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jul 2014 03:07:29 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 7 Jul 2014 03:07:28 -0700
Message-ID: <53BA715D.6010901@windriver.com>
Date: Mon, 7 Jul 2014 18:07:25 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LbLcADdC0qC7cYNDWoZOjvj_BXg42-K4siPE518MykU2Q@mail.gmail.com>
In-Reply-To: <CAJTo0LbLcADdC0qC7cYNDWoZOjvj_BXg42-K4siPE518MykU2Q@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 07 Jul 2014 10:07:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2014 05:40 PM, Burton, Ross wrote:
> On 5 July 2014 07:06, Ming Liu <ming.liu@windriver.com> wrote:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from
>> install of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
> Your patch doesn't move the file that is conflicting so it won't help...
>
> As you'll only ever install a single instance of the binaries, the
> correct fix would be to split the ML-appropriate libraries into a
> libgconf, but leave the DBus service and tools in the main package.
> Then multilib images can install lib32gconf, lib64gconf, and gconf.
Hi, Ross:

I got your point, but my patch was not tring to address the conflict of 
binaries or libraries, that kind of conflicts would not cause build 
error, as you pointed out, only ever a single instance be installed at 
one time. It's actually tring to fix a conflict of conf file, if the 
gconfd-2 is put into libexec directory, we have to keep a path like 
/usr/lib64/gconf/gconfd-2(or /usr/lib/gconf/gconfd-2 in lib32 case) 
referring it in /usr/share/dbus-1/services/org.gnome.GConf.service which 
will cause the conflict.

the best,
thank you
>
> Ross
>
>


