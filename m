Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RJYYr-0003X4-Qt
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:36:34 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 27 Oct 2011 15:30:32 -0700
Received: by pzk4 with SMTP id 4so16718436pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 15:30:32 -0700 (PDT)
Received: by 10.68.30.5 with SMTP id o5mr706593pbh.9.1319754631932;
	Thu, 27 Oct 2011 15:30:31 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id w8sm18117331pbn.11.2011.10.27.15.30.31
	(version=SSLv3 cipher=OTHER); Thu, 27 Oct 2011 15:30:31 -0700 (PDT)
Message-ID: <4EA9DB8C.7070504@intel.com>
Date: Thu, 27 Oct 2011 15:30:36 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201110272230.29012.schnitzeltony@gmx.de>
	<4EA9C265.80703@intel.com>
	<201110272342.19640.schnitzeltony@gmx.de>
In-Reply-To: <201110272342.19640.schnitzeltony@gmx.de>
Subject: Re: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 22:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/2011 02:42 PM, Andreas Müller wrote:
> On Thursday, October 27, 2011 10:43:17 PM Scott Garman wrote:
>> On 10/27/2011 01:30 PM, Andreas Müller wrote:
>>> Since the last updates of all layers (angstrom based) I have issues with
>>>
>>> * networkmanager/nm-applet (meta-oe): I am not allowed to change the settings
>>>     any more
>>> * xfce-session (meta-oe): Logging out takes very long and Restart/Shutdown is
>>>     disabled
>>>
>>> I remember that I had similar issues a while ago. That could be worked around
>>> by starting some dbus stuff ( do not exactly remember what it was ).
>>>
>>> With this vague idea I checked and found in oe-core:
>>>
>>> | dbus: use useradd class to allow use in read-only filesystems
>>> | author	Otavio Salvador<otavio@ossystems.com.br>
>>> | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13
>>>
>>> Not understanding totally what is all about I see in /etc/passw
>>>
>>> | messagebus:x:999:998::/var/lib/dbus:/bin/sh
>>>
>>> but I don't have /var/lib/dbus on my sytem!!
>>>
>>> I did not check yet, but maybe this is an incompatibilty with angstrom custom
>>>
>>> | FILESYSTEM_PERMS_TABLES = "fs-perms-angstrom.txt"
>>>
>>> somebody around to enlight the darkness?
>>
>> useradd should be creating the home directory automatically, but I'd
>> guess it's not being picked up during packaging. Try adding:
>>
>> ${localstatedir}/lib/dbus
>>
>> to FILES_${PN}
>>
>> This is a reasonable guess off the top of my head.
>>
>> Scott
>>
>>
> On the machine I created /var/lib/dbus and made messagebus owner but no change
> in behaviour..

And in retrospect, I now realize the useradd utility should create this 
home directory at rootfs creation time, so there's no chance it could be 
a packaging problem. So forget my initial suggestion.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


