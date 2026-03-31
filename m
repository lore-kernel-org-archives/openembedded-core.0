Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B7D109B48E
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:30:44 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23053.1774971041818678336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s+v44J29;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-126ea4b77adso8283790c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774971041; cv=none;
        d=google.com; s=arc-20240605;
        b=eLSqpa0DUQDqNjPWZWy00aYzhXBTCLswOnfXdBSTqo0H2rvO/GenyxRFDz6x9EcALz
         hDUbtbEMc1KuBNBwP0KbZRIU0O7NuK+z9MIanZbAad7bs1EEM+ekmbqpVhgZzcIeaNUd
         ikDkXuZWf6bdqwRY9EU4ovdMLzqdki6BcPySmSwWunb8Tz0AKY8sfg3YR5kG4V9+Tzts
         Md25brGruabV2UKadmOJNvZiCLkDCvQy5BPDP1TCwdowPSErUPkTpOUuJIB0b9pUxDkD
         sO1UssodWlKPjzfDFjIVnpzxSSvhrzhoKkIM89DpTK6CpsMiTaGYm3OYchVpZdolZjMp
         9VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hzb/zeyL8j4DfrA0FZjGJRHBVhDH+eAPNfT4r86I/S0=;
        fh=S7/sK8EQ1mFd1pq+JI6LVEdFR++R0x4bWvYdNlc53wc=;
        b=OSDqGHAXpTcXQIhjvrXX/zUFI3XJME6vm9juhJPTMsW1NrHQQLe+17gX8FZnuMCdpy
         yg1d/YGLVvTmeC+kTj+gCF1ACXXvH0jZkLS39xQHhGo26vXt13twUr2NIo9rzkF0QnbB
         A+uXKDgSpFcgMJ2fAvPMCGGZ100ONB7KmhHRIjcS+duJMCoI64dufnYSdkti3hIpke44
         DfwJAhudxWu8vT3XTV6TczGG909Cfa0XjC46dd9TAqAmPfbBRSf1RCnxbpbt5jW0fFbc
         bZy3Yb6ABSFOGSC8q+FQuxJImxaOHUC3zmmy5CmzvjzLjggYKw7wAd6EHBW4Hejp+dkP
         2UOQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971041; x=1775575841; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hzb/zeyL8j4DfrA0FZjGJRHBVhDH+eAPNfT4r86I/S0=;
        b=s+v44J29DSrFRLf0R2l+CsqW/sbGyzHYO0wPyWGUfzFgmddJ9kFOnqNsVOYrk0HhI4
         x3RQ/sgGOtOs9C72ZgQkVnx9k08dZnvwU9OLH+/jlqUkHXZQNFTXNkFOt4uJg8ool/aH
         24cOvrT6zcTWEbgFAA3kQDnH20wZKQ7J+l+9F+31ymrq53BxT2EFlGE+khkDEohRoVXJ
         65FsHutkbwoJm5tGd1C9dNT+45KSiVUnWQB4Fhcmo2YGgT51d+ymIzu+ba8KYe1veqxx
         19BXmA7o65h0Sr/y2go/yVq3v9E0ldrsUZi8ayEdA6J04Kxsgc5dQb2h0LxJXrqCYw9q
         QW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971041; x=1775575841;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzb/zeyL8j4DfrA0FZjGJRHBVhDH+eAPNfT4r86I/S0=;
        b=p8ryVnOTTCpOu+4XE32Jnj7r7GuFvGCb+PX/AONnoipATp0L6ncQNW4d9SQV5dubLO
         Oh7gJ8nyRh5MIgM4g4eDm91l7nrzdCaR1cvOB0K/Qy1PJJonN/gDyFvsG2Hd0bY169y2
         mEm7x/OL/F8XnzMIF3j6raKZiPgzuQ2RQlW40Djfn8dvV1TmUELjPBcU8cqssCJ9d4k+
         +oKU/jShOwP0x1KowMyeIgp/t4fy8QNviZYJltlFtJhjrfYLAuSQdDEdignvtgyfT3/e
         7lS7oBsyrsPPDrNpZ8ft6VUJgIkuTt7JmtNkNlMSg8JSfY2nz1xzL4ffyHct48ryfFab
         68SQ==
X-Gm-Message-State: AOJu0YybO2EImWX0SUQHR2S1m6akdiIv3wtW+QAA6pqLKO8sOsu92RWm
	KR7+UgJ8hQC3FooRA2H0XRLj+ew55M8p8666M1ZO04Ek2yC/EM4zERteFFUo/lEj0MbDGB4gwGc
	dadIbLtZH9/mZr0bVm2cFthe4lSJ9JWYEx6BqJHY=
X-Gm-Gg: ATEYQzzpTupKoYaAQIzVPnuhgSKT/pvxTELbUii9SY/E/n0MOSqA1PxmHWKuA/7Th9U
	ZGlDlBhoviv5CePZKyLtGg82YOH/pC+jJIO+8IUOeCrmXSbV3QvURZqtZtPzH21+uS9Fh2PeVE8
	j+miq83ZumvuoIEccAFppG9Nh3l6XpsxDzFX8V8x0To/9vtc4a2d+C87/pQfX9UdY7lVKhccUKd
	Ao/SjxLU/blXhx2w9QiSk9+TZNl6+VerzjN/DV1ElK7GEZooeLcudTMsu9Wmf+e6RSLlm/PqVkM
	uCQJlXPbj4UyJiUTI/wQmQwMceHSaoJGnO9uLyy4
X-Received: by 2002:a05:7022:220a:b0:12a:7181:2f1a with SMTP id
 a92af1059eb24-12ab2857e49mr8686097c88.5.1774971040505; Tue, 31 Mar 2026
 08:30:40 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 31 Mar 2026 17:30:27 +0200
X-Gm-Features: AQROBzCEltjODwAKeehF5dFh7HOeY80c53FmewJVu_1IUhYgCzwo4qQMOHpojg0
Message-ID: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
Subject: Runqemu error on core-image-minimal
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b2585064e53a69a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234302

--0000000000005b2585064e53a69a
Content-Type: text/plain; charset="UTF-8"

Hello all,
As mentioned on the call today, I have an issue in a configuration with
bitbake-setup, oe-core-master fragments and runqemu:

$ runqemu qemux86-64
runqemu - INFO - Running MACHINE=qemux86-64 bitbake -e  ...
runqemu - WARNING - Couldn't run 'MACHINE=qemux86-64 bitbake -e  ' to
gather environment information, maybe the target wasn't an image name, will
retry with virtual/kernel as a target:
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has
already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment
machine/qemux86-64'.
ERROR: Unable to parse
/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/bitbake/lib/bb/__init__.py",
line 262, in fatal
   raise BBHandledException()
bb.BBHandledException


Traceback (most recent call last):
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu",
line 1726, in run_bitbake_env
   return subprocess.check_output(cmd, shell=True).decode('utf-8')
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
   return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "/usr/lib/python3.12/subprocess.py", line 571, in run
   raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command 'MACHINE=qemux86-64 bitbake -e  '
returned non-zero exit status 1.

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu",
line 1792, in main
   config.check_args()
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu",
line 620, in check_args
   self.check_arg_machine(unknown_arg)
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu",
line 493, in check_arg_machine
   self.bitbake_e = self.run_bitbake_env(arg)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^
 File
"/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu",
line 1735, in run_bitbake_env
   return subprocess.check_output(cmd, shell=True).decode('utf-8')
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
   return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 File "/usr/lib/python3.12/subprocess.py", line 571, in run
   raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command 'MACHINE=qemux86-64 bitbake -e
 virtual/kernel' returned non-zero exit status 1.
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 17047514.08

Anyone has seen something like that?

Build commands (bitbake hash  7cf11787ee7942a00ba7e8fa2c590a2563070c38)
mkdir my-first-bitbake-setup-project
cd my-first-bitbake-setup-project/
git clone https://git.openembedded.org/bitbake
./bitbake/bin/bitbake-setup init
.
/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-master/build/init-build-env
bitbake-config-build list-fragments
bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
bitbake-config-build enable-fragment
core/yocto/root-login-with-empty-password
bitbake core-image-minimal

Kind regards,
Marta

--0000000000005b2585064e53a69a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>As mentioned on the call today, =
I have an issue in a configuration=C2=A0with bitbake-setup, oe-core-master =
fragments and runqemu:</div><div><br></div><div>
<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">$ runqemu qemux86-64</span><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e =C2=A0...</span=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - WARNING - Couldn&#39;t run &#39;MACHINE=3Dqemux86-64 bitbake -=
e =C2=A0&#39; to gather environment information, maybe the target wasn&#39;=
t an image name, will retry with virtual/kernel as a target:</span><span st=
yle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">ERROR: A builtin fragment &#39;machine/qemux86-64&#39; is used while MAC=
HINE has already got an assignment.</span><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">Please either disable the fragment or remove the value assignment.</span=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">To disable the fragment, use &#39;bitbake-config-build disable-fragment =
machine/qemux86-64&#39;.</span><span style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">ERROR: Unable to parse /home/ubuntu/my-first-bitbake-setup-project/bitba=
ke-builds/oe-nodistro-master/layers/bitbake/lib/bb/__init__.py</span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">Traceback (most recent call last):</span><span style=3D"color:rgb(0,0,0)=
;background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/bitbake/lib/bb/__init__.py&quot;, line 262, =
in fatal</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255=
,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0raise BBHandledException()</span><span style=3D"color=
:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">bb.BBHandledException</span><span style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">
</span><br>
<br>
<br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">Trac=
eback (most recent call last):</span><span style=3D"color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu&quot;, lin=
e 1726, in run_bitbake_env</span><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0return subprocess.check_output(cmd, shell=3DTrue).dec=
ode(&#39;utf-8&#39;)</span><span style=3D"color:rgb(0,0,0);background-color=
:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</span><span style=3D"color:rgb(0,0,0);backgro=
und-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/usr/lib/python3.12/subprocess.py&quot;, line 466, in =
check_output</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255=
,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeo=
ut, check=3DTrue,</span><span style=3D"color:rgb(0,0,0);background-color:rg=
b(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</span><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/usr/lib/python3.12/subprocess.py&quot;, line 571, in =
run</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)=
">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0raise CalledProcessError(retcode, process.args,</span=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">subprocess.CalledProcessError: Command &#39;MACHINE=3Dqemux86-64 bitbake=
 -e =C2=A0&#39; returned non-zero exit status 1.</span><span style=3D"color=
:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>
<br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">Duri=
ng handling of the above exception, another exception occurred:</span><span=
 style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>
<br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">Trac=
eback (most recent call last):</span><span style=3D"color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu&quot;, lin=
e 1792, in main</span><span style=3D"color:rgb(0,0,0);background-color:rgb(=
255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0config.check_args()</span><span style=3D"color:rgb(0,=
0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu&quot;, lin=
e 620, in check_args</span><span style=3D"color:rgb(0,0,0);background-color=
:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0self.check_arg_machine(unknown_arg)</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu&quot;, lin=
e 493, in check_arg_machine</span><span style=3D"color:rgb(0,0,0);backgroun=
d-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0self.bitbake_e =3D self.run_bitbake_env(arg)</span><s=
pan style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^=
^</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/home/ubuntu/my-first-bitbake-setup-project/bitbake-bu=
ilds/oe-nodistro-master/layers/openembedded-core/scripts/runqemu&quot;, lin=
e 1735, in run_bitbake_env</span><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0return subprocess.check_output(cmd, shell=3DTrue).dec=
ode(&#39;utf-8&#39;)</span><span style=3D"color:rgb(0,0,0);background-color=
:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</span><span style=3D"color:rgb(0,0,0);backgro=
und-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/usr/lib/python3.12/subprocess.py&quot;, line 466, in =
check_output</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255=
,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeo=
ut, check=3DTrue,</span><span style=3D"color:rgb(0,0,0);background-color:rg=
b(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</span><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0File &quot;/usr/lib/python3.12/subprocess.py&quot;, line 571, in =
run</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)=
">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"> =C2=A0=C2=A0=C2=A0raise CalledProcessError(retcode, process.args,</span=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">subprocess.CalledProcessError: Command &#39;MACHINE=3Dqemux86-64 bitbake=
 -e =C2=A0virtual/kernel&#39; returned non-zero exit status 1.</span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Cleaning up</span><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Host uptime: 17047514.08</span><span style=3D"color:rgb=
(0,0,0);background-color:rgb(255,255,255)"></span><br></span></div><div><br=
><span style=3D"font-family:monospace"></span></div><div><span style=3D"fon=
t-family:monospace">Anyone has seen something like that?</span></div><div><=
br></div><div>Build commands (bitbake hash=C2=A0






<span style=3D"font-family:monospace"><span style=3D"color:rgb(178,104,24);=
background-color:rgb(255,255,255)">7cf11787ee7942a00ba7e8fa2c590a2563070c38=
</span>)</span>
</div><div>






<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">mkdir my-first-bitbake-setup-project</span><s=
pan style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">cd my-first-bitbake-setup-project/</span><span style=3D"color:rgb(0,0,0)=
;background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">git clone <a href=3D"https://git.openembedded.org/bitbake">https://git.o=
penembedded.org/bitbake</a></span><span style=3D"color:rgb(0,0,0);backgroun=
d-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">./bitbake/bin/bitbake-setup init</span><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">. /home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro=
-master/build/init-build-env</span><span style=3D"color:rgb(0,0,0);backgrou=
nd-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">bitbake-config-build list-fragments</span><span style=3D"color:rgb(0,0,0=
);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn</span>=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">bitbake-config-build enable-fragment core/yocto/root-login-with-empty-pa=
ssword</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,2=
55)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">bitbake core-image-minimal</span><br><span style=3D"color:rgb(0,0,0);bac=
kground-color:rgb(255,255,255)"></span></span></div><div><br></div><div>Kin=
d regards,</div><div>Marta</div></div>

--0000000000005b2585064e53a69a--

