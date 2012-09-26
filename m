Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TGmS7-0007MT-Qa
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 09:54:39 +0200
Received: by iebc13 with SMTP id c13so664225ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 00:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=RO+E9tBV1x8OWilMsBpbXzejFblbpmx+JOuQDADyZE4=;
	b=YoSEmBJdCSWOeysYPl816nXRR8MvH/BpT9oiyjkJhoKV+w7/C2ARke2n6ObYepk6Vz
	0cUO/U9KDvMRYMvV9A02SNV4xgKbCBa7Fli6QYAx1mDUuOnIJfGYcyH9Wwiajx6GT4dY
	YdOUVlN9M+HxI1kHjX8THIWPGwn1Cw+nZr8EpgGqiJuMTiD4SXUI8Pm36OhKiC9zWrmk
	SV96ocYwPOAVFXVGH0i6Hnx00hPLva3QnPlsXJS6Pl9HRF5mfMUG2foKlv5SiC4x53cX
	Kf7z18z0zlFzKeod6YJ2ZbxqkSmXAu4fTXlmaAqcpGd6g7Ug8w5bgA5h+WpGTIcndnIH
	XVIQ==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr10377429igc.50.1348645309166;
	Wed, 26 Sep 2012 00:41:49 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 26 Sep 2012 00:41:49 -0700 (PDT)
In-Reply-To: <5062AA0F.3050604@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
	<CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
	<5062AA0F.3050604@intel.com>
Date: Wed, 26 Sep 2012 09:41:49 +0200
Message-ID: <CALbNGRRT47T4RsVHSypgg0J12+0R0y1y6jPWK4GGTgZAaG_2sA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 0/7] Postinstall improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 07:54:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 9:09 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>
>
> On 09/20/2012 07:12 PM, Andreas M=FCller wrote:
>> On Thu, Sep 20, 2012 at 5:38 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
>>> <laurentiu.palcu@intel.com> wrote:
>>>>
>>>>
>>>> On 09/19/2012 04:41 PM, Andreas M=FCller wrote:
>>>>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> It's been quite a long time since I sent the first version of postin=
stall
>>>>>> improvements which, after some debate, we decided it needed run-once
>>>>>> support of postinst scriptlets on host. This patcheset (RFC actually=
) adds
>>>>>> that.
>>>>>>
>>>>>> So, in order to achieve this goal I took advantage of
>>>>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some post=
inst
>>>>>> scriptlets is time consuming (even on host) and execute repeatedly,
>>>>>> then we can postpone the running and run the scriplet just once. The=
 idea is
>>>>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory. =
When the
>>>>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the scri=
pts in
>>>>>> this directory and execute them.
>>>>>>
>>>>>> This actual patchset does the above for the gtk icon cache generatio=
n which
>>>>>> takes a very long time to run on target and even on some hosts.
>>>>>>
>>>>>> The people willing to give this patchset a test, are most than welco=
me. Also,
>>>>>> please feel free to review.
>>>>>>
>>>>>> Thanks,
>>>>>> Laurentiu
>>>>>>
>>>>> Thanks for taking care. I will give it a test tonight and hope to hav=
e
>>>>> results tomorrow.
>>>> It would be great if you could give it a try and let me know your resu=
lts.
>>>>
>>> I removed gtk-native append in meta-oe, build from scratch and tested
>>> the image. No issues so far - seems you have done a great job -
>>> Thanks!
>>>
>> Aargh I really would like to consider this done but I found suspicious
>> when browsing on the machine with the new image (hicolor- and
>> gnome-icon-theme installed):
>>
>> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
>> * /usr/share/icons/hicolor/icon-theme.cache is there but it has the
>> date of 01.01.2000 (have no rtc backup on the machine). I would expect
>> this file to have build host's date.
>>
>> So I checked the contents on the build machine in image's rootfs:
>>
>> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
>> * /usr/share/icons/hicolor/icon-theme.cache is there but has only
>> 64,5KB (the version on the machine is 2,3MB!!).
> Did you have any chance to debug the issue on your setup? I tried to
> replicate your environment but I failed. Lots of build errors, so I gave
> up. It would have taken me more time to make your setup work than
> debugging the real problem.
>
> Another alternative would be for you to prepare a tarball with all the
> repos and configs that you use and put it somewhere where I can take it.
> It would be easier for me to directly start debugging your issue.
>
Sorry but I am occupied by other issues at the moment. Hope to find
time at the weekend to add some debug messages to see what's going on.

Andreas


