Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1R1gsm-0003pa-87
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 17:51:16 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Sep 2011 08:45:05 -0700
Received: by yxm34 with SMTP id 34so1312078yxm.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2011 08:45:04 -0700 (PDT)
Received: by 10.236.77.105 with SMTP id c69mr5181758yhe.113.1315496704790;
	Thu, 08 Sep 2011 08:45:04 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com [207.192.74.254])
	by mx.google.com with ESMTPS id c62sm3788667yhj.25.2011.09.08.08.45.02
	(version=SSLv3 cipher=OTHER); Thu, 08 Sep 2011 08:45:03 -0700 (PDT)
Message-ID: <4E68E2EF.10402@intel.com>
Date: Thu, 08 Sep 2011 08:44:47 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1315427297.4368.4.camel@lenovo.internal.reciva.com>	<4E683D5E.70103@linux.intel.com>
	<1315464889.4368.6.camel@lenovo.internal.reciva.com>
In-Reply-To: <1315464889.4368.6.camel@lenovo.internal.reciva.com>
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH] dbus: fix paths in startup script, use useradd.bbclass for user creation
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
X-List-Received-Date: Thu, 08 Sep 2011 15:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2011 11:54 PM, Phil Blundell wrote:
> On Wed, 2011-09-07 at 20:58 -0700, Saul Wold wrote:
>> On 09/07/2011 01:28 PM, Phil Blundell wrote:
>>> Replace various hard-coded references to /usr, /var and /etc with symbolic equivalents.
>>>
>>> Also replace adhoc usage of adduser/addgroup with useradd.bbclass
>>> functionality.  This should, in theory, remove the need for a postinst
>>> to be run at boot time.
>>>
>>> Signed-off-by: Phil Blundell<philb@gnu.org>
>>
>> This one seems to have some problems:
>>
>> ERROR: Function 'useradd_sysroot' failed (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825
>> for further information)
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>> 'bit-64', 'x86_64-linux', 'common']
>> | ERROR: Function 'useradd_sysroot' failed (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825
>> for further information)
>> | Running groupadd commands...
>> | sent invalidate(passwd) request, exiting
>> | sent invalidate(group) request, exiting
>> | sent invalidate(group) request, exiting
>> | sent invalidate(passwd) request, exiting
>> | sent invalidate(group) request, exiting
>> | sent invalidate(group) request, exiting
>> | Running useradd commands...
>> | useradd: group messagebus exists - if you want to add this user to
>> that group, use -g.
>> NOTE: package dbus-1.4.12-r6: task do_install: Failed
>
> That sounds a bit like the useradd option parsing bug (in shadow-native)
> that I mentioned the other day.  I had meant to send a patch for that
> but I forgot.
>
> Do any other recipes which use useradd.bbclass work for you?

Hi Phil,

So sorry for not jumping into these threads for so long. I've been way 
behind in my email and working on some non-development projects.

It appears you have found a bug in the way the shadow utils were patched 
to support a custom sysroot option. I have been testing the useradd 
class using the useradd_example recipe in Poky's meta-skeleton:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb

This example does provide several command line options to the useradd 
binary, so I'm not sure how I missed this.

In any case, please submit your patch and I will advocate for its 
inclusion in our 1.1 release.

I hate to jump in and then out like this, but I am slammed preparing for 
a conference next week, and the week after that I will be on vacation. 
Mark Hatle should be familiar enough with the code to answer questions 
and do code review.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


