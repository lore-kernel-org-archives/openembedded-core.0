Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXvCM-0002AL-1w
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:13:44 +0200
Received: by mail-vc0-f170.google.com with SMTP id gf12so559481vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=/UhLHVlYaHH9nwA6nv7L2s1u5e14cHuNX5rwzmSWXqQ=;
	b=wMl43lD+NOVgPugusZnU33/UPTdJ9e6CeXzgnZsD57RVBqLM7A/D8BgscEfe04MPN3
	k9BLAuTZbYCU38EZGs83qEwVaRSMUCn13RB8lZqqF0jmtYCqiGgbr7C33rSGDEdOVXWa
	tC5+Uyh8i6hYzGpfYgO3iYMMhuWtTogBmuIv5w8kWcfMBbryiKyn2yaVMcTQ40G/wlbF
	IeDH+eZEmonbrOOVYFGca+Z/vs5OMmOX5jKWtDyOzFQOZQueIcgaX39Rm7/us3VHzR5n
	m9Vg0OSnXqCyw6TylDYZteSpV+PWsqhWCKuWdZwy0lOnyTyRPBQL/KzP9xMn+nr0/tf9
	v7fg==
MIME-Version: 1.0
X-Received: by 10.220.78.131 with SMTP id l3mr2270758vck.54.1367506536055;
	Thu, 02 May 2013 07:55:36 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 07:55:35 -0700 (PDT)
In-Reply-To: <51827D4B.4070907@windriver.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
Date: Thu, 2 May 2013 16:55:35 +0200
Message-ID: <CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 15:13:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>
>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>
>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>
>>>> on one of my build machines useradd.bbclass seem to use the UID/GID of
>>>> build host. On other machines useradd works correct.
>>>>
>>>> I have the follwing in gdm:
>>>>
>>>> <snip>
>>>> do_install_append() {
>>>>
>>>>       ...
>>>>       chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>       chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>
>>>> }
>>>>
>>>> ...
>>>>
>>>> USERADD_PACKAGES =3D "${PN}"
>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>> <snip/>
>
>
> I don't know how ipk and deb handle this.  But with the RPM system it
> captures the uname/gname (not uid/gid) and uses that when installing the
> file(s).  This way the USERADD is processed before the install and the ri=
ght
> value is used during the install.
>
> We may have a problem here where we need to also process the useradd
> -before- the do_install runs so that it's available for pseudo to use for
> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless we set=
 a
> static value we could still have a problem.)
1. gdm's log.do_install starts with so I assume the useradd stuff is
performed before do_install.

| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| DEBUG: Executing shell function useradd_sysroot
| Running useradd commands...
| DEBUG: Shell function useradd_sysroot finished
| DEBUG: Executing shell function do_install

2. I did a cleansstate + rebuild for gdm to ensure that user/groups
are in sysroot - but the same I get host's IDs

Andreas


