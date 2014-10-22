Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD3860097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:58:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9MAwhGD000979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:58:43 -0700 (PDT)
Received: from marks-mbp.corp.ad.wrs.com (128.224.176.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 03:58:43 -0700
Message-ID: <54478DE1.9080202@windriver.com>
Date: Wed, 22 Oct 2014 18:58:41 +0800
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1413960370.git.Chong.Lu@windriver.com>	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
In-Reply-To: <CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 22 Oct 2014 10:58:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/14, 6:07 PM, Burton, Ross wrote:
> On 22 October 2014 08:09, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
>> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
>
> I'm clearly not understanding how our multilib implementation works,
> but you don't need many copies of the main gconf package, just one in
> the preferred configuration. What is causing multiple copies of gconf
> to be installed?

Installing both the lib32 and "regular" version of gconf attempts to install the 
file "/usr/share/dbus-1/services/org.gnome.GConf.service" twice.  (This is 
normally acceptable, as long as the -contents- of the file are identical.)  For 
whatever reason the contents are different, and the usual way to fix this is to 
provide a unique file that both versions can include.

This way only one version will be installed, but yet the other service elements 
will be properly duplicated.

I'd like a bit more information in the commit message indicating what the 
conflict actually was between both files (since I believe the service file is 
textual so a diff is easy to include).

--Mark

> Ross
>


