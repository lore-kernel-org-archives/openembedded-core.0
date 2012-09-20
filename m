Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEjYz-0004U2-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 18:25:17 +0200
Received: by iaky10 with SMTP id y10so1767866iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EY+pVZuGt1nfok2lMUpCe1W8ssx+HWbvnAeHsiu+sTE=;
	b=I9UZCCYq/nWbZ2se0RzdUK5UJ/Flb/Mlzm9iCBxDldQjQ8u0Qcx3qArAnly9OX+qLL
	Ne+lQwyDoPSbh+plUdCbm1LFKGC2Mh1uAi1DOY+PS17GG9/2uycvP7suQNP0WOgBGXko
	GIbiHy4WivpSBogFkf0nm/sLK0H9yxa+++a6H8c0/je9eT4UwTehogOoLtc8rNsdpHLH
	Jbquh7fp/u+IKPl6M31F3AlOR0rNoN4uDjdCnWPMmQPAbQRzy4BoyeH4wCxZrQxIdD48
	Up+I1IjKIARyY8PGdQjrPCoUqn5LqL0nNXxqXxgUncn1/sOXjcp9pClRwIVCjpulYkO8
	2fnw==
MIME-Version: 1.0
Received: by 10.50.104.230 with SMTP id gh6mr2896593igb.50.1348157553984; Thu,
	20 Sep 2012 09:12:33 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 20 Sep 2012 09:12:33 -0700 (PDT)
In-Reply-To: <CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
Date: Thu, 20 Sep 2012 18:12:33 +0200
Message-ID: <CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 20 Sep 2012 16:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2012 at 5:38 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>>
>>
>> On 09/19/2012 04:41 PM, Andreas M=FCller wrote:
>>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
>>> <laurentiu.palcu@intel.com> wrote:
>>>> Hi,
>>>>
>>>> It's been quite a long time since I sent the first version of postinst=
all
>>>> improvements which, after some debate, we decided it needed run-once
>>>> support of postinst scriptlets on host. This patcheset (RFC actually) =
adds
>>>> that.
>>>>
>>>> So, in order to achieve this goal I took advantage of
>>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some postin=
st
>>>> scriptlets is time consuming (even on host) and execute repeatedly,
>>>> then we can postpone the running and run the scriplet just once. The i=
dea is
>>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory. Wh=
en the
>>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the script=
s in
>>>> this directory and execute them.
>>>>
>>>> This actual patchset does the above for the gtk icon cache generation =
which
>>>> takes a very long time to run on target and even on some hosts.
>>>>
>>>> The people willing to give this patchset a test, are most than welcome=
. Also,
>>>> please feel free to review.
>>>>
>>>> Thanks,
>>>> Laurentiu
>>>>
>>> Thanks for taking care. I will give it a test tonight and hope to have
>>> results tomorrow.
>> It would be great if you could give it a try and let me know your result=
s.
>>
> I removed gtk-native append in meta-oe, build from scratch and tested
> the image. No issues so far - seems you have done a great job -
> Thanks!
>
Aargh I really would like to consider this done but I found suspicious
when browsing on the machine with the new image (hicolor- and
gnome-icon-theme installed):

* in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
* /usr/share/icons/hicolor/icon-theme.cache is there but it has the
date of 01.01.2000 (have no rtc backup on the machine). I would expect
this file to have build host's date.

So I checked the contents on the build machine in image's rootfs:

* in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
* /usr/share/icons/hicolor/icon-theme.cache is there but has only
64,5KB (the version on the machine is 2,3MB!!).


Andreas


