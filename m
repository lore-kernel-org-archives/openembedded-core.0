Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3427.1624596499399706319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 21:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PLzHfvKN;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: chuckwolber@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id g21so5367148pfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 21:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=k8oaLnXOVnrpeLarc3ZgqKFLMo7e9GWp5iuSARXF7Nc=;
        b=PLzHfvKN1DQXy9b6TJnffeEkN4JpXpMb+im3Cvg8J88o5cpv1D/0cyoxRK/ePQjT4V
         ZrKCdNuL8nXPWPJU3k4mzMqycVLbhH3jEoqD8yoLJLohenpcGtfEBAzVJYppkX4n2jCy
         iI28WqGo7I18yCzECJUZW55Cf5iJIVSHPV5DH6FCUtngHboldPBQzSHlsz3emyrDvMxe
         3HwYKWSpkuT5awLfFlkmp+p6/sIXKGX59VbAeoaciXPYdHl6l8pNI5UN70VW2/yAZQ5J
         3utOMEqje64i9i9uzXOg1Vo/x/WCmIR1hxQujfqX+Z+f5hm8yMb8h4bXRgUQJzFmc2un
         Cg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=k8oaLnXOVnrpeLarc3ZgqKFLMo7e9GWp5iuSARXF7Nc=;
        b=BE599X8/PMPFphZeZXZtXect5MKDcZVBEw55jzQCeBqTw1CReCj48IhBU5RqwuxmAF
         4Sh7apGnrYyKcjvBmWE7/IsebBMISTdrY6oQXRXp0TsJsYOgIRIi5gt8FkA++3W1XLpt
         Gman8GhQWe6lWExaLaTc7UKhNSpQF4DwRBWZWGLXm+pyJkk7u6qw1C67PXo0luZ6vufa
         NZlqTI/qoQwqJMrkrpGHQpjSHQhGNJoZqYDfVXOK83SU7Z0z+DAPfe9PPT7eX/cy+jRV
         4Is1oTJGtReK1R9TiGpUJty+F0z04Px46dtEPhChbNjOe+0Ri4A9Dyj4c4R8nPsRwUjJ
         Bsbg==
X-Gm-Message-State: AOAM5316/E0tEiKpkSLLv126aJlw4cfkdi12xuhN4i2wqNx48OAD8wuq
	fbTZluP9pe5gwAoUmXkZ7LF6jXU1KPNbl9cqf8bDla83PFneKQ==
X-Google-Smtp-Source: ABdhPJwa6cA0cY9cSbhakL7rT7PUutK6r/lDw3/xz+zbK2X49oqfQLiI7df9DhAzeOFs6Kkt/ZzO+mmsHVj241d0lLE=
X-Received: by 2002:a05:6a00:10d4:b029:305:4ab6:90ba with SMTP id
 d20-20020a056a0010d4b02903054ab690bamr8500241pfu.1.1624596498331; Thu, 24 Jun
 2021 21:48:18 -0700 (PDT)
MIME-Version: 1.0
From: "Chuck Wolber" <chuckwolber@gmail.com>
Date: Thu, 24 Jun 2021 21:48:07 -0700
Message-ID: <CAB=6tBQR1S=2niGMojS_55-JebtQX4LybA2aEh_6YNtXf_3yNA@mail.gmail.com>
Subject: Hardknott (GCC10) Compiler Issues
To: openembedded-core@lists.openembedded.org, 
	Yocto-mailing-list <yocto@yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002fbd5305c58fd997"

--0000000000002fbd5305c58fd997
Content-Type: text/plain; charset="UTF-8"

All,

Please accept my apologies in advance for the detailed submission. I think
it is warranted in this
case.

There is something... "odd" about the GCC 10 compiler that is delivered
with Hardknott. I am still
chasing it down, so I am not yet ready to declare a root cause or submit a
bug, but I am posting
what I have now in case anyone has some insights to offer.

For all I know it is something unusual that I am doing, but we have a lot
of history with our
build/dev/release methods, so I would be surprised if that was actually the
case. I have also
discussed aspects of this on IRC for the last few days, so some of this may
be familiar to some
of you.

Background: We maintain a virtual machine SDK for our developers that is as
close as possible to
the actual embedded hardware environment that we target. The SDK image is
our baseline Linux
OS plus lots of the expected dev and debugging tools. The image deployed to
our target devices is
the baseline Linux OS plus the core application suite. It is also important
to note that we only
support the x86_64 machine architecture in our target devices and
development workstations.

We also spin up and spin down the SDK VM for our nightly builds. This
guarantees strict consistency
and eliminates lots of variables when we are trying to troubleshoot
something hairy.

We just upgraded from Thud to Hardknott. This means we built our new
Hardknott based SDK VM
image from our Thud based SDK VM (GCC 8 / glibc 2.28). When we attempted to
build our target
device image in the new Hardknott based SDK VM, we consistently got a
segfault when any build
task involves bison issuing a warning of some sort. I traced this down for
a very long time and it
seemed to have something to do with the libtextstyle library from gettext
and the way bison used it.
But I now believe that this to be a red herring. Bison seems to be very
fragile, but in this case,
that may have actually been a good thing.

After some experimentation I found that the issue went away when I dropped
down to the 3.6.4
recipe of bison found at OE-Core:bc95820cd. But this did not sit right with
me. There is no way I
should be the only person seeing this issue.

Then I tried an experiment... I assumed I was encountering a compiler
bootstrap issue with such a
big jump (GCC8 -> GCC10), so I rebuilt our hardknott based SDK VM with the
3.3.1 version of
buildtools-extended. The build worked flawlessly, but when I booted into
the new SDK VM and
kicked off the build I got the same result (bison segfault when any build
warnings are encountered).

This is when I started to mentally put a few more details together with
other post-upgrade issues that
had been discovered in our lab. We attributed them to garden variety API
and behavioral changes
expected during a Yocto upgrade, but now I am not so sure.

During the thud-to-hardknott upgrade process, we did nightly builds of the
new hardknott based
target image from our thud based SDK VM. I assumed that since GCC10 was
being built as part of
the build sysroot bootstrap process, we were getting a clean and consistent
result irrespective of the
underlying build server OS.

One of the issues we were seeing in the lab was a periodic hang during the
initramfs phase of the
boot process. We run a couple of setup scripts to manage the sysroot before
the switch_root, so it
is not unusual to see some "growing pains" after an upgrade. The hangs were
random with no
obvious cause, but systemd is very weird anyway so we attributed it to a
new dependency or race
condition that we had to address after going from systemd 239 to 247.

It is also worth noting that systemd itself was not hung, it responded to
the 'ole "three finger salute"
and dutifully filled the screen with shutdown messages. It was just that
the boot process randomly
stopped cold in initramfs before the switch root. We would also
occasionally see systemd
complaining in the logs, "Starting requested but asserts failed".

Historically, when asserts fail, it is a sign of a much larger problem, so
I did another experiment...

Since we could build our SDK VM successfully with buildtools-extended, why
not build the target
images? So I did. After a day of testing in the lab, none of the testers
have seen the boot hang up in
the initramfs stage, whereas before it was happening about 50% of the time.
I need a good week of
successful test activity before I am willing to declare success, but the
results were convincing
enough to make it worth this summary post.

I did an extensive amount of trial and error testing, including
meticulously comparing
buildtools-extended with our own versions of the same files. The only
intersection point was gcc.

The gcc delivered with buildtools-extended works great. When I build
hardknott's gcc10 from the
gcc in buildtools-extended, we are not able to build our target images with
the resulting compiler.
When I build our target images from the old thud environment, we get a
mysterious hang and
systemd asserts triggering during boot. Since GCC10 is an intermediate
piece of the build, it is
also implicated despite the native environment running GCC8.

I will continue to troubleshoot this but I was hoping for some insight (or
gentle guidance if I am
making a silly mistake). Overall, I am at a loss to think of a reason why I
should not be able to build
a compiler from the buildtools-extended compiler and then use it to
reliably build our target images.

Thank you,

..Ch:W..


P.S. For those who are curious, we started out on Pyro hosted on Ubuntu
16.04. From there we made
the jump to self hosting when we used that environment to build a thud
based VM SDK. After years of
successful build, we are now in the process of upgrading to Hardknott.

P.P.S. For the sake of completeness, I had to add the following files to
the buildtools-extended
sysroot to fully complete the build of our images:

/usr/include/magic.h -> util-linux "more" command requires this.
/usr/include/zstd.h -> I do not recall which recipe required this.
/usr/bin/free -> The OpenJDK 8 build scripts need this.
/usr/include/sys/* -> openjdk-8-native
/lib/libcap.so.2 -> The binutils "dir" command quietly breaks the build
without this. I am not a fan of the
                            lack of error checking in the binutils build...
/usr/include/sensors/error.h and sensors.h -> mesa-native
/usr/include/zstd_errors.h -> qemu-system-native

-- 
"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire

--0000000000002fbd5305c58fd997
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>All,</div><div><br></div><div>Please accep=
t my apologies in advance for the detailed submission. I think it is warran=
ted in this</div><div>case.<br></div><div><br></div><div>There is something=
... &quot;odd&quot; about the GCC 10 compiler that is delivered with Hardkn=
ott. I am still</div><div>chasing it down, so I am not yet ready to declare=
 a root cause or submit a bug, but I am posting</div><div>what I have now i=
n case anyone has some insights to offer.</div><div><br></div><div>For all =
I know it is something unusual that I am doing, but we have a lot of histor=
y with our</div><div>build/dev/release methods, so I would be surprised if =
that was actually the case. I have also</div><div>discussed aspects of this=
 on IRC for the last few days, so some of this may be familiar to some</div=
><div>of you.<br></div><div><br></div><div>Background: We maintain a virtua=
l machine SDK for our developers that is as close as possible to<br></div><=
div>the actual embedded hardware environment that we target. The SDK image =
is our baseline Linux</div><div>OS plus lots of the expected dev and debugg=
ing tools. The image deployed to our target devices is</div><div>the baseli=
ne Linux OS plus the core application suite. It is also important to note t=
hat we only</div><div>support the x86_64 machine architecture in our target=
 devices and development workstations.<br></div><div><br></div><div>We also=
 spin up and spin down the SDK VM for our nightly builds. This guarantees s=
trict consistency</div><div>and eliminates lots of variables when we are tr=
ying to troubleshoot something hairy.</div><div><br></div><div>We just upgr=
aded from Thud to Hardknott. This means we built our new Hardknott based SD=
K VM</div><div>image from our Thud based SDK VM (GCC 8 / glibc 2.28). When =
we attempted to build our target</div><div>device image in the new Hardknot=
t based SDK VM, we consistently got a segfault when any build</div><div>tas=
k involves bison issuing a warning of some sort. I traced this down for a v=
ery long time and it</div><div>seemed to have something to do with the libt=
extstyle library from gettext and the way bison used it.</div><div>But I no=
w believe that this to be a red herring. Bison seems to be very fragile, bu=
t in this case,</div><div>that may have actually been a good thing.<br></di=
v><div><br></div><div>After some experimentation I found that the issue wen=
t away when I dropped down to the 3.6.4</div><div>recipe of bison found at =
OE-Core:bc95820cd. But this did not sit right with me. There is no way I</d=
iv><div>should be the only person seeing this issue.<br></div><div><br></di=
v><div>Then I tried an experiment... I assumed I was encountering a compile=
r bootstrap issue with such a</div><div>big jump (GCC8 -&gt; GCC10), so I r=
ebuilt our hardknott based SDK VM with the 3.3.1 version of</div><div>build=
tools-extended. The build worked flawlessly, but when I booted into the new=
 SDK VM and</div><div>kicked off the build I got the same result (bison seg=
fault when any build warnings are encountered).<br></div><div><br></div><di=
v>This is when I started to mentally put a few more details together with o=
ther post-upgrade issues that</div><div>had been discovered in our lab. We =
attributed them to garden variety API and behavioral changes</div><div>expe=
cted during a Yocto upgrade, but now I am not so sure.</div><div><br></div>=
<div>During the thud-to-hardknott upgrade process, we did nightly builds of=
 the new hardknott based <br></div><div>target image from our thud based SD=
K VM. I assumed that since GCC10 was being built as part of</div><div>the b=
uild sysroot bootstrap process, we were getting a clean and consistent resu=
lt irrespective of the</div><div>underlying build server OS.</div><div><br>=
</div><div>One of the issues we were seeing in the lab was a periodic hang =
during the initramfs phase of the</div><div>boot process. We run a couple o=
f setup scripts to manage the sysroot before the switch_root, so it</div><d=
iv>is not unusual to see some &quot;growing pains&quot; after an upgrade. T=
he hangs were random with no</div><div>obvious cause, but systemd is very w=
eird anyway so we attributed it to a new dependency or race</div><div>condi=
tion that we had to address after going from systemd 239 to 247. <br></div>=
<div><br></div><div>It is also worth noting that systemd itself was not hun=
g, it responded to the &#39;ole &quot;three finger salute&quot;</div><div>a=
nd dutifully filled the screen with shutdown messages. It was just that the=
 boot process randomly</div><div>stopped cold in initramfs before the switc=
h root. We would also occasionally see systemd</div><div>complaining in the=
 logs, &quot;Starting requested but asserts failed&quot;.</div><div><br></d=
iv><div>Historically, when asserts fail, it is a sign of a much larger prob=
lem, so I did another experiment...</div><div><br></div><div>Since we could=
 build our SDK VM successfully with buildtools-extended, why not build the =
target</div><div>images? So I did. After a day of testing in the lab, none =
of the testers have seen the boot hang up in</div><div>the initramfs stage,=
 whereas before it was happening about 50% of the time. I need a good week =
of</div><div>successful test activity before I am willing to declare succes=
s, but the results were convincing</div><div>enough to make it worth this s=
ummary post.<br></div><div><br></div><div>I did an extensive amount of tria=
l and error testing, including meticulously comparing</div><div>buildtools-=
extended with our own versions of the same files. The only intersection poi=
nt was gcc.</div><div><br></div><div>The gcc delivered with buildtools-exte=
nded works great. When I build hardknott&#39;s gcc10 from the</div><div>gcc=
 in buildtools-extended, we are not able to build our target images with th=
e resulting compiler.</div><div>When I build our target images from the old=
 thud environment, we get a mysterious hang and</div><div>systemd asserts t=
riggering during boot. Since GCC10 is an intermediate piece of the build, i=
t is</div><div>also implicated despite the native environment running GCC8.=
<br></div><div><br></div><div>I will continue to troubleshoot this but I wa=
s hoping for some insight (or gentle guidance if I am</div><div>making a si=
lly mistake). Overall, I am at a loss to think of a reason why I should not=
 be able to build</div><div>a compiler from the buildtools-extended compile=
r and then use it to reliably build our target images.<br></div><div><br></=
div><div>Thank you,</div><div><br></div><div>..Ch:W..<br></div><div><br></d=
iv><div><br></div><div>P.S. For those who are curious, we started out on Py=
ro hosted on Ubuntu 16.04. From there we made</div><div>the jump to self ho=
sting when we used that environment to build a thud based VM SDK. After yea=
rs of</div><div>successful build, we are now in the process of upgrading to=
 Hardknott.<br></div><div><br></div><div>P.P.S. For the sake of completenes=
s, I had to add the following files to the buildtools-extended</div><div>sy=
sroot to fully complete the build of our images:</div><div><br></div><div>/=
usr/include/magic.h -&gt; util-linux &quot;more&quot; command requires this=
.</div><div>/usr/include/zstd.h -&gt; I do not recall which recipe required=
 this.</div><div>/usr/bin/free -&gt; The OpenJDK 8 build scripts need this.=
<br></div><div>/usr/include/sys/* -&gt; openjdk-8-native</div><div>/lib/lib=
cap.so.2 -&gt; The binutils &quot;dir&quot; command quietly breaks the buil=
d without this. I am not a fan of the</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lack of error =
checking in the binutils build...<br></div><div>/usr/include/sensors/error.=
h and sensors.h -&gt; mesa-native</div><div>/usr/include/zstd_errors.h -&gt=
; qemu-system-native<br></div><div><br></div>-- <br>&quot;Perfection must b=
e reached by degrees; she requires the slow hand of time.&quot; - Voltaire<=
/div>

--0000000000002fbd5305c58fd997--
