Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5830D74534
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:49:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6O2n3aK026606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jul 2018 19:49:04 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 23 Jul 2018 19:49:03 -0700
To: Alistair Francis <alistair23@gmail.com>, Andre McCurdy
	<armccurdy@gmail.com>
References: <20180718225304.28673-1-alistair.francis@wdc.com>
	<CAJ86T=XuEUrsb8gZAXmh3m+sXFpU2T=bXqNRhjLYUNCH9DNtDg@mail.gmail.com>
	<CAKmqyKNrUdU9wcUH8no9J_XNE=4ztujQ95tap7Zk5HBWv9XT9g@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <70aa673f-3611-8fe8-0f33-0a533e15aae4@windriver.com>
Date: Tue, 24 Jul 2018 10:52:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNrUdU9wcUH8no9J_XNE=4ztujQ95tap7Zk5HBWv9XT9g@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Allow custom coredump config options
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
X-List-Received-Date: Tue, 24 Jul 2018 02:49:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2018 07:16 AM, Alistair Francis wrote:
> On Wed, Jul 18, 2018 at 4:48 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Jul 18, 2018 at 3:53 PM, Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>>> If the user has enabled coredump let's allow them to customise the
>>> config options.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_239.bb | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>>> index 7822548993..a625d060a9 100644
>>> --- a/meta/recipes-core/systemd/systemd_239.bb
>>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>>> @@ -279,6 +279,18 @@ do_install() {
>>>                          chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>>                  fi
>>>          fi
>>> +
>>> +  # If coredump was enabled, enable it in the config.
>>> +  # This just sets the default, but can be used to customise the values.
>>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>>> +    sed 's|#Storage.*|Storage=external|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#Compress.*|Compress=yes|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#ProcessSizeMax.*|ProcessSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#ExternalSizeMax.*|ExternalSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#JournalSizeMax.*|JournalSizeMax=767M|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#MaxUse.*|MaxUse=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#KeepFree.*|KeepFree=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>> How does this allow the user to customise the config options?
> They can edit the sed command line and have different options.
>
>> By forcing the options to the _current_ default values you are
>> creating a maintenance problem - ie you'll still be forcing these
>> values even if/when the upstream defaults are changed.
> That is a good point, is there a usual way to allow edits to config
> files like this?
>
> Alistair
>

It depends on what package you are modifying, as different packages have 
different ways to handle their configuration. It also depends on what 
configuration you are going to customize, maybe the config customization 
is generally wanted by most users, maybe it's not.

Back to this systemd coredump case, the best way to customize things is 
to drop in configuration files to /etc/systemd/coredump.conf.d/ via 
bbappend.
https://www.freedesktop.org/software/systemd/man/coredump.conf.html

Best Regards,
Chen Qi

>>> +  fi
>>>   }
>>>
>>>
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



