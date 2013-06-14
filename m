Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id BB07E60130
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 12:04:55 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id y6so504087lbh.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s7ip9j01yWWpA/fG38VPesiyEHqHTY7lC5vqly0r1GY=;
	b=KA1gnS5dJOGB0mux+rBbvb4LTTFQeGcPmhuk8QP6Bm/KwLSbGFWh0osumVsvp0Lg8U
	4J0p0/8r7U/wgOrf1UV+oJxrwXm+/Typxm2xT67Jdg6zVyqoDcLZ/emkYaV3idwl0MxD
	GmH78JMMkw14v9u02FT58Rut4jAUl2HNjigJEB+nOi2q/igxBHXUHW8J2BgKq5Eassfu
	zVTlZSII8CrLj/EHHE8akiNp/mtCGHo1Ev07g+CmHdZW+mnLYnSsrUopWXlEBybyex7P
	AHHktlXwzYx9bIzHwAmuxkLK9rP9EoOj7Y7xyW5jSOaaGnur5Uo4izQ0GJpRzHOgbxkS
	ZOAg==
MIME-Version: 1.0
X-Received: by 10.112.14.33 with SMTP id m1mr987115lbc.17.1371211496102; Fri,
	14 Jun 2013 05:04:56 -0700 (PDT)
Received: by 10.114.63.75 with HTTP; Fri, 14 Jun 2013 05:04:55 -0700 (PDT)
In-Reply-To: <51B96ADF.90208@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<1760eefec11e9a25b4fb20375105c64c82b82227.1370585547.git.Qi.Chen@windriver.com>
	<20130611202607.GA22231@mx.loc> <51B96ADF.90208@windriver.com>
Date: Fri, 14 Jun 2013 14:04:55 +0200
Message-ID: <CAC1BbcT=yzTDY1WDF7+JpMnQ1ZfRzJ9QREmPaOT+zL3Gor8Qgw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 14 Jun 2013 12:04:56 -0000
X-Groupsio-MsgNum: 40603
Content-Type: multipart/mixed; boundary=001a11c37b0a231edc04df1c0ed8

--001a11c37b0a231edc04df1c0ed8
Content-Type: text/plain; charset=ISO-8859-1

On 13 June 2013 08:46, ChenQi <Qi.Chen@windriver.com> wrote:
> On 06/12/2013 04:26 AM, Bernhard Reutner-Fischer wrote:
>>
>> On Fri, Jun 07, 2013 at 02:13:58PM +0800, Qi.Chen@windriver.com wrote:

> Hi Bernhard,
>
> Thank you very much for your review and suggestions!
> I went through your methods below very carefully and I tried your patch out.
>
> Here are two problems.
>
> 1) The config_list.suid could be derived by renaming the `original
> suid_config_list' file, but what about the config_list.nosuid? We have a
> suid_config_list, because compared with the non-suid apps, the amount of
> config items for suid apps or related to suid apps are relatively small. It
> seems that config_list.nosuid will be a very long list.

yes. You can derive the nosuid by subtracting the suid from the full .config.
If that is inconvenient, see the attached on top to generate both
busybox.cfg.nosuid and busybox.cfg.suid .
see below.
>
> 2) Your patch in the attachment worked out well. `make busybox.applets.suid'
> generates a file named busybox.applets.suid which contains the following
> config items.
> CONFIG_LOGIN
> CONFIG_PASSWD
> CONFIG_FEATURE_PASSWD_WEAK_CHECK
> CONFIG_SU
> CONFIG_FEATURE_SU_SYSLOG
> CONFIG_FEATURE_SU_CHECKS_SHELLS
> CONFIG_VLOCK
> CONFIG_FINDFS
> CONFIG_MOUNT
> CONFIG_FEATURE_MOUNT_FAKE
> CONFIG_FEATURE_MOUNT_VERBOSE
> CONFIG_FEATURE_MOUNT_LABEL
> CONFIG_FEATURE_MOUNT_CIFS
> CONFIG_FEATURE_MOUNT_FLAGS
> CONFIG_FEATURE_MOUNT_FSTAB
> CONFIG_FEATURE_MOUNT_LOOP
> CONFIG_FEATURE_MOUNT_LOOP_CREATE
> CONFIG_CRONTAB
> CONFIG_WALL
> CONFIG_PING
> CONFIG_PING6
> CONFIG_TRACEROUTE
> CONFIG_TRACEROUTE6
> CONFIG_FEATURE_TRACEROUTE_VERBOSE
>
> You see, this is a subset of the suid_config_list. As stated in the file's
> comments, part of the list is obtained from a command, and part of it is
> obtained by manually examine the Config.in files to find out the config
> items that are related to suid apps.

Yes, i know. Do you have suggestions there?
I think what we/you want is to build:
- busybox.suid with all nosuid *applets* turned off, but the
non-applet CONFIG_ as per full.config
- busybox.nosuid with all suid *applets* turned off, but the
non-applet CONFIG_ as per full.config

I.e. take busybox.cfg.nosuid (contains only applets), take
busybox.cfg.suid (also contains only applets)
subtract these -> non-applet_part_of_full.config.
merge non-applet_part_of_full.config + suid -> bb.suid
merge non-applet_part_of_full.config + nosuid -> bb.nosuid

Didn't try that, but you get the idea.
Would that work out for you?

cheers,
>
> Best Regards,
> Chen Qi
>
>> cat .config > .config-oe-full
>> # it would be nice to 'for s in suid nosuid'
>> # but that would mean operating on ${s}_config_list which bitbake (IIRC)
>> # ruins. Better rename the files to config_list.suid to be able to loop.
>> #
>> for s in suid nosuid; do
>>    egrep ^CONFIG_ ${WORKDIR}/config_list.$s | while read i; do
>>      grep -w "$i" .config
>>    done > .config.$s
>>
>>    # populate the config, default everything else to no
>>    KCONFIG_ALLCONFIG=config.$s make allnoconfig
>>    oe_runmake busybox_unstripped busybox.links
>>    mv busybox_unstripped busybox.$s
>>    mv busybox.links busybox.links.$s
>> done
>> cat .config-oe-full > .config
>>
>> I would much prefer to make the generation of the suid cfg stuff more
>> robust. Could you live with the attached helper thing (untested)?
>> That would make it a prepended oe_runmake busybox.applets.suid to
>> generate the list busybox.applets.suid. If that suits your needs we can
>> apply it to busybox for general use..
>> The other possibility is, obviously, to fit all this in busybox' build
>> itself, but given that we do have a seemingly working, bugless suid
>> handling this might be better suited to be dealt with by the user as you
>> suggest here.
>>
>> Thoughts?
>> thanks,
>>>
>>> +               cp .config .config.orig
>>> +               oe_runmake allnoconfig
>>> +               cp .config .config.allno
>>> +               for item in `grep 'CONFIG_' ${WORKDIR}/suid_config_list`;
>>> do
>>> +                       echo "# $item is not set" >> .config.nosuid.tmp
>>> +                       grep -w "$item" .config.orig >> .config.suid.tmp
>>> +               done
>>> +               merge_config.sh -m .config.orig .config.nosuid.tmp
>>> +               cp .config .config.nosuid
>>> +               merge_config.sh -m .config.allno .config.suid.tmp
>>> +               cp .config .config.suid
>>> +
>>> +               # compile with no suid apps
>>> +               cp .config.nosuid .config
>>> +               oe_runmake busybox_unstripped
>>> +               cp busybox_unstripped busybox.nosuid
>>> +               oe_runmake busybox.links
>>> +               cp busybox.links busybox.links.nosuid
>>> +
>>> +               # compile with suid apps
>>> +               cp .config.suid .config
>>> +               oe_runmake busybox_unstripped
>>> +               cp busybox_unstripped busybox.suid
>>> +               oe_runmake busybox.links
>>> +               cp busybox.links busybox.links.suid
>>> +
>>> +               # copy .config.orig back to .config, because the install
>>> process may check this file
>>> +               cp .config.orig .config
>>> +
>>> +               # cleanup
>>> +               rm .config.orig .config.nosuid.tmp .config.allno
>>> .config.suid.tmp .config.nosuid .config.suid
>>> +       else
>>> +               oe_runmake busybox_unstripped
>>> +               cp busybox_unstripped busybox
>>> +               oe_runmake busybox.links
>>> +       fi
>>> }

--001a11c37b0a231edc04df1c0ed8
Content-Type: application/octet-stream; name="bb-suid-lists-both.00.patch"
Content-Disposition: attachment; filename="bb-suid-lists-both.00.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hhxbm16c0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlLmN1c3RvbSBiL01ha2VmaWxlLmN1c3RvbQppbmRleCA0MWMz
NTFmLi4zNTYxZTU3IDEwMDY0NAotLS0gYS9NYWtlZmlsZS5jdXN0b20KKysrIGIvTWFrZWZpbGUu
Y3VzdG9tCkBAIC01LDggKzUsMTAgQEAKIGJ1c3lib3gubGlua3M6ICQoc3JjdHJlZSkvYXBwbGV0
cy9idXN5Ym94Lm1rbGwgJChvYmp0cmVlKS9pbmNsdWRlL2F1dG9jb25mLmggaW5jbHVkZS9hcHBs
ZXRzLmgKIAkkKFEpLSQoU0hFTEwpICReID4gJEAKIAotYnVzeWJveC5hcHBsZXRzLnN1aWQ6ICQo
c3JjdHJlZSkvYXBwbGV0cy9idXN5Ym94Lm1rc3VpZCAkKG9ianRyZWUpL2luY2x1ZGUvYXV0b2Nv
bmYuaCBpbmNsdWRlL2FwcGxldHMuaAotCSQoUSktJChTSEVMTCkgJF4gPiAkQAorYnVzeWJveC5j
Zmcuc3VpZDogJChzcmN0cmVlKS9hcHBsZXRzL2J1c3lib3gubWtzdWlkICQob2JqdHJlZSkvaW5j
bHVkZS9hdXRvY29uZi5oIGluY2x1ZGUvYXBwbGV0cy5oCisJJChRKS1TVUlEPSJ5ZXMiICQoU0hF
TEwpICReID4gJEAKK2J1c3lib3guY2ZnLm5vc3VpZDogJChzcmN0cmVlKS9hcHBsZXRzL2J1c3li
b3gubWtzdWlkICQob2JqdHJlZSkvaW5jbHVkZS9hdXRvY29uZi5oIGluY2x1ZGUvYXBwbGV0cy5o
CisJJChRKS1TVUlEPSJEUk9QIiAkKFNIRUxMKSAkXiA+ICRACiAKIC5QSE9OWTogaW5zdGFsbAog
aWZlcSAoJChDT05GSUdfSU5TVEFMTF9BUFBMRVRfU1lNTElOS1MpLHkpCmRpZmYgLS1naXQgYS9h
cHBsZXRzL2J1c3lib3gubWtzdWlkIGIvYXBwbGV0cy9idXN5Ym94Lm1rc3VpZAppbmRleCA0MjM1
ZDg5Li42NDkyYzA3IDEwMDc1NQotLS0gYS9hcHBsZXRzL2J1c3lib3gubWtzdWlkCisrKyBiL2Fw
cGxldHMvYnVzeWJveC5ta3N1aWQKQEAgLTEsMTEgKzEsMTYgQEAKICMhL2Jpbi9zaAotIyBNYWtl
IGJ1c3lib3ggbGlzdCBvZiBhcHBsZXRzIHRoYXQgZG8gTk9UIGRyb3Agc3VpZCBwZXJtaXNzaW9u
cworIyBNYWtlIGxpc3Qgb2YgY29uZmlndXJhdGlvbiB2YXJpYWJsZXMgcmVnYXJkaW5nIHN1aWQg
aGFuZGxpbmcKIAogIyBpbnB1dCAkMTogZnVsbCBwYXRoIHRvIGF1dG9jb25mLmgKICMgaW5wdXQg
JDI6IGZ1bGwgcGF0aCB0byBhcHBsZXRzLmgKICMgaW5wdXQgJDM6IGZ1bGwgcGF0aCB0byAuY29u
ZmlnCiAjIG91dHB1dCAoc3Rkb3V0KTogbGlzdCBvZiBDT05GSUdfIHRoYXQgZG8gb3IgbWF5IHJl
cXVpcmUgc3VpZAogCisjIElmIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBTVUlEIGlzIG5vdCBz
ZXQgb3Igc2V0IHRvIERST1AsCisjIGxpc3RzIGFsbCBjb25maWcgb3B0aW9ucyB0aGF0IGRvIG5v
dCByZXF1aXJlIHN1aWQgcGVybWlzc2lvbnMuCisjIE90aGVyd2lzZSwgbGlzdHMgYWxsIGNvbmZp
ZyBvcHRpb25zIGZvciBhcHBsZXRzIHRoYXQgRE8gb3IgTUFZIHJlcXVpcmUKKyMgc3VpZCBwZXJt
aXNzaW9ucy4KKwogIyBNYWludGFpbmVyOiBCZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXIKIAogZXhw
b3J0IExDX0FMTD1QT1NJWApAQCAtMTQsMTAgKzE5LDIwIEBAIGV4cG9ydCBMQ19DVFlQRT1QT1NJ
WAogQ09ORklHX0g9JHsxOi1pbmNsdWRlL2F1dG9jb25mLmh9CiBBUFBMRVRTX0g9JHsyOi1pbmNs
dWRlL2FwcGxldHMuaH0KIERPVF9DT05GSUc9JHszOi0uY29uZmlnfQorCitjYXNlICR7U1VJRDot
RFJPUH0gaW4KK1tkRF1bclJdW29PXVtwUF0pIFVTRT0iRFJPUCIgOzsKKyopIFVTRT0ic3VpZCIg
OzsKK2VzYWMKKwogJEhPU1RDQyAtRSAtRE1BS0VfU1VJRCAtaW5jbHVkZSAkQ09ORklHX0ggJEFQ
UExFVFNfSCB8Ci0gIGF3ayAnCisgIGF3ayAtdiBVU0U9JHtVU0V9ICcKICAgICAvXlNVSURbIFx0
XS97Ci0gICAgICBpZiAoJDIgPT0gIkJCX1NVSURfRFJPUCIpIG5leHQKKyAgICAgIGlmIChVU0Ug
PT0gIkRST1AiKSB7CisgICAgICAgIGlmICgkMiAhPSAiQkJfU1VJRF9EUk9QIikgbmV4dAorICAg
ICAgfSBlbHNlIHsKKyAgICAgICAgaWYgKCQyID09ICJCQl9TVUlEX0RST1AiKSBuZXh0CisgICAg
ICB9CiAgICAgICBjZmcgPSAkTkYKICAgICAgIGdzdWIoIlwiIiwgIiIsIGNmZykKICAgICAgIGNm
ZyA9IHN1YnN0cihjZmcsIDgpCg==

--001a11c37b0a231edc04df1c0ed8--
