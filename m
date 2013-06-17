Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 525C060812
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:52:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H5qscm026633
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2013 22:52:54 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 16 Jun 2013 22:52:54 -0700
Message-ID: <51BEA438.2060405@windriver.com>
Date: Mon, 17 Jun 2013 13:52:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<1760eefec11e9a25b4fb20375105c64c82b82227.1370585547.git.Qi.Chen@windriver.com>
	<20130611202607.GA22231@mx.loc> <51B96ADF.90208@windriver.com>
	<CAC1BbcT=yzTDY1WDF7+JpMnQ1ZfRzJ9QREmPaOT+zL3Gor8Qgw@mail.gmail.com>
In-Reply-To: <CAC1BbcT=yzTDY1WDF7+JpMnQ1ZfRzJ9QREmPaOT+zL3Gor8Qgw@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, Denys Vlasenko <vda.linux@googlemail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] busybox: add the ability to split the busybox binary
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
X-List-Received-Date: Mon, 17 Jun 2013 05:52:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your patience and all your explanations.
Now a version 2 has been sent out, containing changes from your 
suggestions and the patch you wrote.
Please help review it if convenient.

Best Regards,
Chen Qi

On 06/14/2013 08:04 PM, Bernhard Reutner-Fischer wrote:
> On 13 June 2013 08:46, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 06/12/2013 04:26 AM, Bernhard Reutner-Fischer wrote:
>>> On Fri, Jun 07, 2013 at 02:13:58PM +0800, Qi.Chen@windriver.com wrote:
>> Hi Bernhard,
>>
>> Thank you very much for your review and suggestions!
>> I went through your methods below very carefully and I tried your patch out.
>>
>> Here are two problems.
>>
>> 1) The config_list.suid could be derived by renaming the `original
>> suid_config_list' file, but what about the config_list.nosuid? We have a
>> suid_config_list, because compared with the non-suid apps, the amount of
>> config items for suid apps or related to suid apps are relatively small. It
>> seems that config_list.nosuid will be a very long list.
> yes. You can derive the nosuid by subtracting the suid from the full .config.
> If that is inconvenient, see the attached on top to generate both
> busybox.cfg.nosuid and busybox.cfg.suid .
> see below.
>> 2) Your patch in the attachment worked out well. `make busybox.applets.suid'
>> generates a file named busybox.applets.suid which contains the following
>> config items.
>> CONFIG_LOGIN
>> CONFIG_PASSWD
>> CONFIG_FEATURE_PASSWD_WEAK_CHECK
>> CONFIG_SU
>> CONFIG_FEATURE_SU_SYSLOG
>> CONFIG_FEATURE_SU_CHECKS_SHELLS
>> CONFIG_VLOCK
>> CONFIG_FINDFS
>> CONFIG_MOUNT
>> CONFIG_FEATURE_MOUNT_FAKE
>> CONFIG_FEATURE_MOUNT_VERBOSE
>> CONFIG_FEATURE_MOUNT_LABEL
>> CONFIG_FEATURE_MOUNT_CIFS
>> CONFIG_FEATURE_MOUNT_FLAGS
>> CONFIG_FEATURE_MOUNT_FSTAB
>> CONFIG_FEATURE_MOUNT_LOOP
>> CONFIG_FEATURE_MOUNT_LOOP_CREATE
>> CONFIG_CRONTAB
>> CONFIG_WALL
>> CONFIG_PING
>> CONFIG_PING6
>> CONFIG_TRACEROUTE
>> CONFIG_TRACEROUTE6
>> CONFIG_FEATURE_TRACEROUTE_VERBOSE
>>
>> You see, this is a subset of the suid_config_list. As stated in the file's
>> comments, part of the list is obtained from a command, and part of it is
>> obtained by manually examine the Config.in files to find out the config
>> items that are related to suid apps.
> Yes, i know. Do you have suggestions there?
> I think what we/you want is to build:
> - busybox.suid with all nosuid *applets* turned off, but the
> non-applet CONFIG_ as per full.config
> - busybox.nosuid with all suid *applets* turned off, but the
> non-applet CONFIG_ as per full.config
>
> I.e. take busybox.cfg.nosuid (contains only applets), take
> busybox.cfg.suid (also contains only applets)
> subtract these -> non-applet_part_of_full.config.
> merge non-applet_part_of_full.config + suid -> bb.suid
> merge non-applet_part_of_full.config + nosuid -> bb.nosuid
>
> Didn't try that, but you get the idea.
> Would that work out for you?
>
> cheers,
>> Best Regards,
>> Chen Qi
>>
>>> cat .config > .config-oe-full
>>> # it would be nice to 'for s in suid nosuid'
>>> # but that would mean operating on ${s}_config_list which bitbake (IIRC)
>>> # ruins. Better rename the files to config_list.suid to be able to loop.
>>> #
>>> for s in suid nosuid; do
>>>     egrep ^CONFIG_ ${WORKDIR}/config_list.$s | while read i; do
>>>       grep -w "$i" .config
>>>     done > .config.$s
>>>
>>>     # populate the config, default everything else to no
>>>     KCONFIG_ALLCONFIG=config.$s make allnoconfig
>>>     oe_runmake busybox_unstripped busybox.links
>>>     mv busybox_unstripped busybox.$s
>>>     mv busybox.links busybox.links.$s
>>> done
>>> cat .config-oe-full > .config
>>>
>>> I would much prefer to make the generation of the suid cfg stuff more
>>> robust. Could you live with the attached helper thing (untested)?
>>> That would make it a prepended oe_runmake busybox.applets.suid to
>>> generate the list busybox.applets.suid. If that suits your needs we can
>>> apply it to busybox for general use..
>>> The other possibility is, obviously, to fit all this in busybox' build
>>> itself, but given that we do have a seemingly working, bugless suid
>>> handling this might be better suited to be dealt with by the user as you
>>> suggest here.
>>>
>>> Thoughts?
>>> thanks,
>>>> +               cp .config .config.orig
>>>> +               oe_runmake allnoconfig
>>>> +               cp .config .config.allno
>>>> +               for item in `grep 'CONFIG_' ${WORKDIR}/suid_config_list`;
>>>> do
>>>> +                       echo "# $item is not set" >> .config.nosuid.tmp
>>>> +                       grep -w "$item" .config.orig >> .config.suid.tmp
>>>> +               done
>>>> +               merge_config.sh -m .config.orig .config.nosuid.tmp
>>>> +               cp .config .config.nosuid
>>>> +               merge_config.sh -m .config.allno .config.suid.tmp
>>>> +               cp .config .config.suid
>>>> +
>>>> +               # compile with no suid apps
>>>> +               cp .config.nosuid .config
>>>> +               oe_runmake busybox_unstripped
>>>> +               cp busybox_unstripped busybox.nosuid
>>>> +               oe_runmake busybox.links
>>>> +               cp busybox.links busybox.links.nosuid
>>>> +
>>>> +               # compile with suid apps
>>>> +               cp .config.suid .config
>>>> +               oe_runmake busybox_unstripped
>>>> +               cp busybox_unstripped busybox.suid
>>>> +               oe_runmake busybox.links
>>>> +               cp busybox.links busybox.links.suid
>>>> +
>>>> +               # copy .config.orig back to .config, because the install
>>>> process may check this file
>>>> +               cp .config.orig .config
>>>> +
>>>> +               # cleanup
>>>> +               rm .config.orig .config.nosuid.tmp .config.allno
>>>> .config.suid.tmp .config.nosuid .config.suid
>>>> +       else
>>>> +               oe_runmake busybox_unstripped
>>>> +               cp busybox_unstripped busybox
>>>> +               oe_runmake busybox.links
>>>> +       fi
>>>> }


