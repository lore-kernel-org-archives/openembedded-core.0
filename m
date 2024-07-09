Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A149C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 09:02:19 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.8570.1720515734269515459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aq65AvFk;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8102bbc95d1so1647021241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720515733; x=1721120533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IBnsk5IZL3YAA3houKTjwg6xlckMBKTlnA5fWvRiXr4=;
        b=Aq65AvFkqQ6eVhupaLP38DLtQnKiO99kTHgDbW5WlpAXzDFi8QGSKO6C9FPht/IkPF
         iXGWGNdvZEQ5ew879oG9re7+e58pM7ohOE2xTTqg7gzI8IU/8ecZmHjts58V7qplWc61
         hQ9zoJW/wrnP6UFjXVYoELryGGKnBWE9ujULxU3S01SJrxCQhzLOdxMAiyyhyTZcQtYd
         uyPlYzMX3aIPVOXDNj41W/u2rkvNTcnyHbRjxpdivTnrO/2mJriLgMSqFV4YOV2X8t2x
         yqO/wgqF/nWLLQl9bzt/e/byqmBLwnW4TNbXYJydPqtvBOp8vYC2zWjEqo6YgZ6IxBfh
         4gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515733; x=1721120533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBnsk5IZL3YAA3houKTjwg6xlckMBKTlnA5fWvRiXr4=;
        b=dL8XEaNHsuYR1e6ZVb7kU1zJ7HKMZEqlUpaUse9VQ1V5peV3s8pMYCYMHq6mv1qSMS
         EFDCXTXEUlsm6oz1oRoitXOnJRB1lOkkE6G2h2s6kmnkcaVu0T9lzWwUpLC4yvRsSJch
         I0XsyP64Cq2APmVs6ocX06yg4UIgVCPkVCC4k/q7zwdf32KGmPVotaRaezbcSKnJ96EL
         gCaDfRKiUciEz5Bp7g3V2phGVbEuOy9gyGOJ8BsFzO48p9ayTFnMurp00c/e/xyVmCdY
         69MTX9AXciW+QmV+HTVFNxdwf5VPLqDIdJII22EMErpzUlFYMcepkjRkXFzJTY8M2bgr
         Iadg==
X-Forwarded-Encrypted: i=1; AJvYcCVVRpcBq24u71BEVXZTgsXaOREglyvtYXbKbvVswFqQUbi+Jxu7g5fwbSU+yz4PS0JIzke7rbXJv97y9M5Y202n/XH7d5FLMZpvXI1HOw9V51ItYR61cri9
X-Gm-Message-State: AOJu0Ywl5k7Gx4+2Ct3oopwU92evnIvmYpNim9x6EYSgU7yhH0guMLfa
	VBz6rUmn812QHXujkqXnj2HVnCuip1FpS39aU16yccrBO3ueB/bxJ1xqtZMnFdIFPZXMFsefdWA
	YQpRVT+/I7c+Ny4fxAHEI1AkgeGI=
X-Google-Smtp-Source: AGHT+IFjV6is6YKfFAfJ4nedU/v+HnmltOQ2P//FBsUaLj6jjzzWLdRZizuhy4UF1Hq5YxhDS6GnpLoXPHYWXDEewf4=
X-Received: by 2002:a67:e7c6:0:b0:48f:b1d3:4890 with SMTP id
 ada2fe7eead31-4903222ee34mr2239021137.31.1720515731815; Tue, 09 Jul 2024
 02:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240704124559.194237-2-jose.quaresma@foundries.io>
 <9821df03d3beadfc51c83eb4924152d7977704f9.camel@linuxfoundation.org> <17DF4AA9708313D9.13665@lists.openembedded.org>
In-Reply-To: <17DF4AA9708313D9.13665@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Jul 2024 10:02:00 +0100
Message-ID: <CANPvuR=oQDZP9AmSXHqDbOJnupUHMyrnSoEtE+TqZwpxAvV42w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] openssh: upgrade 9.7p1 -> 9.8p1
To: quaresma.jose@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000000681d4061cccc90f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201649

--0000000000000681d4061cccc90f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (sexta, 5/07/2024 =C3=A0(s) 11:3=
4):

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quinta,
> 4/07/2024 =C3=A0(s) 21:27):
>
>> On Thu, 2024-07-04 at 13:46 +0100, Jose Quaresma via
>> lists.openembedded.org wrote:
>> > Release notes at https://www.openssh.com/txt/release-9.8
>> >
>> > Security
>> > =3D=3D=3D=3D=3D=3D=3D=3D
>> >
>> > This release contains fixes for two security problems, one critical
>> > and one minor.
>> >
>> > 1) Race condition in sshd(8)
>> >
>> > A critical vulnerability in sshd(8) was present in Portable OpenSSH
>> > versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
>> > code execution with root privileges.
>> >
>> > Successful exploitation has been demonstrated on 32-bit Linux/glibc
>> > systems with ASLR. Under lab conditions, the attack requires on
>> > average 6-8 hours of continuous connections up to the maximum the
>> > server will accept. Exploitation on 64-bit systems is believed to be
>> > possible but has not been demonstrated at this time. It's likely that
>> > these attacks will be improved upon.
>> >
>> > Exploitation on non-glibc systems is conceivable but has not been
>> > examined. Systems that lack ASLR or users of downstream Linux
>> > distributions that have modified OpenSSH to disable per-connection
>> > ASLR re-randomisation (yes - this is a thing, no - we don't
>> > understand why) may potentially have an easier path to exploitation.
>> > OpenBSD is not vulnerable.
>> >
>> > We thank the Qualys Security Advisory Team for discovering, reporting
>> > and demonstrating exploitability of this problem, and for providing
>> > detailed feedback on additional mitigation measures.
>> >
>> > 2) Logic error in ssh(1) ObscureKeystrokeTiming
>> >
>> > In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
>> > OpenSSH server version 9.5 or later, a logic error in the ssh(1)
>> > ObscureKeystrokeTiming feature (on by default) rendered this feature
>> > ineffective - a passive observer could still detect which network
>> > packets contained real keystrokes when the countermeasure was active
>> > because both fake and real keystroke packets were being sent
>> > unconditionally.
>> >
>> > This bug was found by Philippos Giavridis and also independently by
>> > Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
>> > University of Cambridge Computer Lab.
>> >
>> > Worse, the unconditional sending of both fake and real keystroke
>> > packets broke another long-standing timing attack mitigation. Since
>> > OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
>> > traffic received on TTYs in echo-off mode, such as when entering a
>> > password into su(8) or sudo(8). This bug rendered these fake
>> > keystroke echoes ineffective and could allow a passive observer of
>> > a SSH session to once again detect when echo was off and obtain
>> > fairly limited timing information about keystrokes in this situation
>> > (20ms granularity by default).
>> >
>> > This additional implication of the bug was identified by Jacky Wei
>> > En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
>> > for their detailed analysis.
>> >
>> > This bug does not affect connections when ObscureKeystrokeTiming
>> > was disabled or sessions where no TTY was requested.
>> >
>> > Future deprecation notice
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> >
>> > OpenSSH plans to remove support for the DSA signature algorithm in
>> > early 2025. This release disables DSA by default at compile time.
>> >
>> > DSA, as specified in the SSHv2 protocol, is inherently weak - being
>> > limited to a 160 bit private key and use of the SHA1 digest. Its
>> > estimated security level is only 80 bits symmetric equivalent.
>> >
>> > OpenSSH has disabled DSA keys by default since 2015 but has retained
>> > run-time optional support for them. DSA was the only mandatory-to-
>> > implement algorithm in the SSHv2 RFCs, mostly because alternative
>> > algorithms were encumbered by patents when the SSHv2 protocol was
>> > specified.
>> >
>> > This has not been the case for decades at this point and better
>> > algorithms are well supported by all actively-maintained SSH
>> > implementations. We do not consider the costs of maintaining DSA
>> > in OpenSSH to be justified and hope that removing it from OpenSSH
>> > can accelerate its wider deprecation in supporting cryptography
>> > libraries.
>> >
>> > This release, and its deactivation of DSA by default at compile-time,
>> > marks the second step in our timeline to finally deprecate DSA. The
>> > final step of removing DSA support entirely is planned for the first
>> > OpenSSH release of 2025.
>> >
>> > DSA support may be re-enabled in OpenBSD by setting "DSAKEY=3Dyes"
>> > in Makefile.inc. To enable DSA support in portable OpenSSH, pass
>> > the "--enable-dsa-keys" option to configure.
>> >
>> > Potentially-incompatible changes
>> > --------------------------------
>> >
>> >  * all: as mentioned above, the DSA signature algorithm is now
>> >    disabled at compile time.
>> >
>> >  * sshd(8): the server will now block client addresses that
>> >    repeatedly fail authentication, repeatedly connect without ever
>> >    completing authentication or that crash the server. See the
>> >    discussion of PerSourcePenalties below for more information.
>> >    Operators of servers that accept connections from many users, or
>> >    servers that accept connections from addresses behind NAT or
>> >    proxies may need to consider these settings.
>> >
>> >  * sshd(8): the server has been split into a listener binary,
>> > sshd(8),
>> >    and a per-session binary "sshd-session". This allows for a much
>> >    smaller listener binary, as it no longer needs to support the SSH
>> >    protocol. As part of this work, support for disabling privilege
>> >    separation (which previously required code changes to disable) and
>> >    disabling re-execution of sshd(8) has been removed. Further
>> >    separation of sshd-session into additional, minimal binaries is
>> >    planned for the future.
>> >
>> >  * sshd(8): several log messages have changed. In particular, some
>> >    log messages will be tagged with as originating from a process
>> >    named "sshd-session" rather than "sshd".
>> >
>> >  * ssh-keyscan(1): this tool previously emitted comment lines
>> >    containing the hostname and SSH protocol banner to standard error.
>> >    This release now emits them to standard output, but adds a new
>> >    "-q" flag to silence them altogether.
>> >
>> >  * sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
>> >    as the PAM service name. A new "PAMServiceName" sshd_config(5)
>> >    directive allows selecting the service name at runtime. This
>> >    defaults to "sshd". bz2101
>> >
>> >  * (portable OpenSSH only) Automatically-generated files, such as
>> >    configure, config.h.in, etc will now be checked in to the portable
>> >    OpenSSH git release branch (e.g. V_9_8). This should ensure that
>> >    the contents of the signed release branch exactly match the
>> >    contents of the signed release tarball.
>> >
>> > Changes since OpenSSH 9.7
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> >
>> > This release contains mostly bugfixes.
>> >
>> > New features
>> > ------------
>> >
>> >  * sshd(8): as described above, sshd(8) will now penalise client
>> >    addresses that, for various reasons, do not successfully complete
>> >    authentication. This feature is controlled by a new sshd_config(5)
>> >    PerSourcePenalties option and is on by default.
>> >
>> >    sshd(8) will now identify situations where the session did not
>> >    authenticate as expected. These conditions include when the client
>> >    repeatedly attempted authentication unsucessfully (possibly
>> >    indicating an attack against one or more accounts, e.g. password
>> >    guessing), or when client behaviour caused sshd to crash (possibly
>> >    indicating attempts to exploit bugs in sshd).
>> >
>> >    When such a condition is observed, sshd will record a penalty of
>> >    some duration (e.g. 30 seconds) against the client's address. If
>> >    this time is above a minimum configurable threshold, then all
>> >    connections from the client address will be refused (along with
>> > any
>> >    others in the same PerSourceNetBlockSize CIDR range) until the
>> >    penalty expire.
>> >
>> >    Repeated offenses by the same client address will accrue greater
>> >    penalties, up to a configurable maximum. Address ranges may be
>> >    fully exempted from penalties, e.g. to guarantee access from a set
>> >    of trusted management addresses, using the new sshd_config(5)
>> >    PerSourcePenaltyExemptList option.
>> >
>> >    We hope these options will make it significantly more difficult
>> > for
>> >    attackers to find accounts with weak/guessable passwords or
>> > exploit
>> >    bugs in sshd(8) itself. This option is enabled by default.
>> >
>> >  * ssh(8): allow the HostkeyAlgorithms directive to disable the
>> >    implicit fallback from certificate host key to plain host keys.
>> >
>> > Bugfixes
>> > --------
>> >
>> >  * misc: fix a number of inaccuracies in the PROTOCOL.*
>> >    documentation files. GHPR430 GHPR487
>> >
>> >  * all: switch to strtonum(3) for more robust integer parsing in most
>> >    places.
>> >
>> >  * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()
>> >
>> >  * ssh-keysign(8): stricter validation of messaging socket fd GHPR492
>> >
>> >  * sftp(1): flush stdout after writing "sftp>" prompt when not using
>> >    editline. GHPR480
>> >
>> >  * sftp-server(8): fix home-directory extension implementation, it
>> >    previously always returned the current user's home directory
>> >    contrary to the spec. GHPR477
>> >
>> >  * ssh-keyscan(1): do not close stdin to prevent error messages when
>> >    stdin is read multiple times. E.g.
>> >    echo localhost | ssh-keyscan -f - -f -
>> >
>> >  * regression tests: fix rekey test that was testing the same KEX
>> >    algorithm repeatedly instead of testing all of them. bz3692
>> >
>> >  * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive
>> >    documentation, especially around what is supported vs available.
>> >    bz3701.
>> >
>> > Portability
>> > -----------
>> >
>> >  * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
>> >    unconditionally. The previous behaviour was to expose it only when
>> >    particular authentication methods were in use.
>> >
>> >  * build: fix OpenSSL ED25519 support detection. An incorrect
>> > function
>> >    signature in configure.ac previously prevented enabling the
>> > recently
>> >    added support for ED25519 private keys in PEM PKCS8 format.
>> >
>> >  * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
>> >    environment variable to enable SSH_ASKPASS, similarly to the X11
>> >    DISPLAY environment variable. GHPR479
>> >
>> >  * build: improve detection of the -fzero-call-used-regs compiler
>> >    flag. bz3673.
>> >
>> >  * build: relax OpenSSL version check to accept all OpenSSL 3.x
>> >    versions.
>> >
>> >  * sshd(8): add support for notifying systemd on server listen and
>> >    reload, using a standalone implementation that doesn't depend on
>> >    libsystemd. bz2641
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >
>> > v2:
>> >  - fix musl build
>> >  - fix sshd-session packing on openssh-sshd
>> >  - rebase on top of the CVE-2024-6387 fix sent
>>
>> Thanks for the fixes. Unfortunately I think there is still one issue
>> remaining as the openssh ptests appear to be hanging on both arm and
>> x86:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6600
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6778
>>
>> On a previous build run I ended up stopping them after 24h+ but I
>> wasn't sure if that was related to other issues with the update or not.
>> It now looks like it is a separate issue :(
>>
>
> I will take a look on this ptests failings.
> Thanks for reporting.
>

I will only be able to return to this next week.
I took a quick look at the ptest but I still didn't understand what was
wrong.
If anyone wants to continue this feel free.

Jose


>
> Jose
>
>
>>
>> Cheers,
>>
>> Richard
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201599):
> https://lists.openembedded.org/g/openembedded-core/message/201599
> Mute This Topic: https://lists.openembedded.org/mt/107036805/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000681d4061cccc90f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (sexta, 5/07/2024 =C3=A0(s) 11:34):<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu (q=
uinta, 4/07/2024 =C3=A0(s) 21:27):<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, 2024-07-04 at 13:46 +0100, Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" r=
el=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8=
</a><br>
&gt; <br>
&gt; Security<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; This release contains fixes for two security problems, one critical<br=
>
&gt; and one minor.<br>
&gt; <br>
&gt; 1) Race condition in sshd(8)<br>
&gt; <br>
&gt; A critical vulnerability in sshd(8) was present in Portable OpenSSH<br=
>
&gt; versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary<=
br>
&gt; code execution with root privileges.<br>
&gt; <br>
&gt; Successful exploitation has been demonstrated on 32-bit Linux/glibc<br=
>
&gt; systems with ASLR. Under lab conditions, the attack requires on<br>
&gt; average 6-8 hours of continuous connections up to the maximum the<br>
&gt; server will accept. Exploitation on 64-bit systems is believed to be<b=
r>
&gt; possible but has not been demonstrated at this time. It&#39;s likely t=
hat<br>
&gt; these attacks will be improved upon.<br>
&gt; <br>
&gt; Exploitation on non-glibc systems is conceivable but has not been<br>
&gt; examined. Systems that lack ASLR or users of downstream Linux<br>
&gt; distributions that have modified OpenSSH to disable per-connection<br>
&gt; ASLR re-randomisation (yes - this is a thing, no - we don&#39;t<br>
&gt; understand why) may potentially have an easier path to exploitation.<b=
r>
&gt; OpenBSD is not vulnerable.<br>
&gt; <br>
&gt; We thank the Qualys Security Advisory Team for discovering, reporting<=
br>
&gt; and demonstrating exploitability of this problem, and for providing<br=
>
&gt; detailed feedback on additional mitigation measures.<br>
&gt; <br>
&gt; 2) Logic error in ssh(1) ObscureKeystrokeTiming<br>
&gt; <br>
&gt; In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an<b=
r>
&gt; OpenSSH server version 9.5 or later, a logic error in the ssh(1)<br>
&gt; ObscureKeystrokeTiming feature (on by default) rendered this feature<b=
r>
&gt; ineffective - a passive observer could still detect which network<br>
&gt; packets contained real keystrokes when the countermeasure was active<b=
r>
&gt; because both fake and real keystroke packets were being sent<br>
&gt; unconditionally.<br>
&gt; <br>
&gt; This bug was found by Philippos Giavridis and also independently by<br=
>
&gt; Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the<br>
&gt; University of Cambridge Computer Lab.<br>
&gt; <br>
&gt; Worse, the unconditional sending of both fake and real keystroke<br>
&gt; packets broke another long-standing timing attack mitigation. Since<br=
>
&gt; OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for<br>
&gt; traffic received on TTYs in echo-off mode, such as when entering a<br>
&gt; password into su(8) or sudo(8). This bug rendered these fake<br>
&gt; keystroke echoes ineffective and could allow a passive observer of<br>
&gt; a SSH session to once again detect when echo was off and obtain<br>
&gt; fairly limited timing information about keystrokes in this situation<b=
r>
&gt; (20ms granularity by default).<br>
&gt; <br>
&gt; This additional implication of the bug was identified by Jacky Wei<br>
&gt; En Kung, Daniel Hugenroth and Alastair Beresford and we thank them<br>
&gt; for their detailed analysis.<br>
&gt; <br>
&gt; This bug does not affect connections when ObscureKeystrokeTiming<br>
&gt; was disabled or sessions where no TTY was requested.<br>
&gt; <br>
&gt; Future deprecation notice<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; OpenSSH plans to remove support for the DSA signature algorithm in<br>
&gt; early 2025. This release disables DSA by default at compile time.<br>
&gt; <br>
&gt; DSA, as specified in the SSHv2 protocol, is inherently weak - being<br=
>
&gt; limited to a 160 bit private key and use of the SHA1 digest. Its<br>
&gt; estimated security level is only 80 bits symmetric equivalent.<br>
&gt; <br>
&gt; OpenSSH has disabled DSA keys by default since 2015 but has retained<b=
r>
&gt; run-time optional support for them. DSA was the only mandatory-to-<br>
&gt; implement algorithm in the SSHv2 RFCs, mostly because alternative<br>
&gt; algorithms were encumbered by patents when the SSHv2 protocol was<br>
&gt; specified.<br>
&gt; <br>
&gt; This has not been the case for decades at this point and better<br>
&gt; algorithms are well supported by all actively-maintained SSH<br>
&gt; implementations. We do not consider the costs of maintaining DSA<br>
&gt; in OpenSSH to be justified and hope that removing it from OpenSSH<br>
&gt; can accelerate its wider deprecation in supporting cryptography<br>
&gt; libraries.<br>
&gt; <br>
&gt; This release, and its deactivation of DSA by default at compile-time,<=
br>
&gt; marks the second step in our timeline to finally deprecate DSA. The<br=
>
&gt; final step of removing DSA support entirely is planned for the first<b=
r>
&gt; OpenSSH release of 2025.<br>
&gt; <br>
&gt; DSA support may be re-enabled in OpenBSD by setting &quot;DSAKEY=3Dyes=
&quot;<br>
&gt; in Makefile.inc. To enable DSA support in portable OpenSSH, pass<br>
&gt; the &quot;--enable-dsa-keys&quot; option to configure.<br>
&gt; <br>
&gt; Potentially-incompatible changes<br>
&gt; --------------------------------<br>
&gt; <br>
&gt; =C2=A0* all: as mentioned above, the DSA signature algorithm is now<br=
>
&gt; =C2=A0=C2=A0 disabled at compile time.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): the server will now block client addresses that<br>
&gt; =C2=A0=C2=A0 repeatedly fail authentication, repeatedly connect withou=
t ever<br>
&gt; =C2=A0=C2=A0 completing authentication or that crash the server. See t=
he<br>
&gt; =C2=A0=C2=A0 discussion of PerSourcePenalties below for more informati=
on.<br>
&gt; =C2=A0=C2=A0 Operators of servers that accept connections from many us=
ers, or<br>
&gt; =C2=A0=C2=A0 servers that accept connections from addresses behind NAT=
 or<br>
&gt; =C2=A0=C2=A0 proxies may need to consider these settings.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): the server has been split into a listener binary,<br>
&gt; sshd(8),<br>
&gt; =C2=A0=C2=A0 and a per-session binary &quot;sshd-session&quot;. This a=
llows for a much<br>
&gt; =C2=A0=C2=A0 smaller listener binary, as it no longer needs to support=
 the SSH<br>
&gt; =C2=A0=C2=A0 protocol. As part of this work, support for disabling pri=
vilege<br>
&gt; =C2=A0=C2=A0 separation (which previously required code changes to dis=
able) and<br>
&gt; =C2=A0=C2=A0 disabling re-execution of sshd(8) has been removed. Furth=
er<br>
&gt; =C2=A0=C2=A0 separation of sshd-session into additional, minimal binar=
ies is<br>
&gt; =C2=A0=C2=A0 planned for the future.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): several log messages have changed. In particular, som=
e<br>
&gt; =C2=A0=C2=A0 log messages will be tagged with as originating from a pr=
ocess<br>
&gt; =C2=A0=C2=A0 named &quot;sshd-session&quot; rather than &quot;sshd&quo=
t;.<br>
&gt; <br>
&gt; =C2=A0* ssh-keyscan(1): this tool previously emitted comment lines<br>
&gt; =C2=A0=C2=A0 containing the hostname and SSH protocol banner to standa=
rd error.<br>
&gt; =C2=A0=C2=A0 This release now emits them to standard output, but adds =
a new<br>
&gt; =C2=A0=C2=A0 &quot;-q&quot; flag to silence them altogether.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): (portable OpenSSH only) sshd will no longer use argv[=
0]<br>
&gt; =C2=A0=C2=A0 as the PAM service name. A new &quot;PAMServiceName&quot;=
 sshd_config(5)<br>
&gt; =C2=A0=C2=A0 directive allows selecting the service name at runtime. T=
his<br>
&gt; =C2=A0=C2=A0 defaults to &quot;sshd&quot;. bz2101<br>
&gt; <br>
&gt; =C2=A0* (portable OpenSSH only) Automatically-generated files, such as=
<br>
&gt; =C2=A0=C2=A0 configure, <a href=3D"http://config.h.in" rel=3D"noreferr=
er" target=3D"_blank">config.h.in</a>, etc will now be checked in to the po=
rtable<br>
&gt; =C2=A0=C2=A0 OpenSSH git release branch (e.g. V_9_8). This should ensu=
re that<br>
&gt; =C2=A0=C2=A0 the contents of the signed release branch exactly match t=
he<br>
&gt; =C2=A0=C2=A0 contents of the signed release tarball.<br>
&gt; <br>
&gt; Changes since OpenSSH 9.7<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; This release contains mostly bugfixes.<br>
&gt; <br>
&gt; New features<br>
&gt; ------------<br>
&gt; <br>
&gt; =C2=A0* sshd(8): as described above, sshd(8) will now penalise client<=
br>
&gt; =C2=A0=C2=A0 addresses that, for various reasons, do not successfully =
complete<br>
&gt; =C2=A0=C2=A0 authentication. This feature is controlled by a new sshd_=
config(5)<br>
&gt; =C2=A0=C2=A0 PerSourcePenalties option and is on by default.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 sshd(8) will now identify situations where the session di=
d not<br>
&gt; =C2=A0=C2=A0 authenticate as expected. These conditions include when t=
he client<br>
&gt; =C2=A0=C2=A0 repeatedly attempted authentication unsucessfully (possib=
ly<br>
&gt; =C2=A0=C2=A0 indicating an attack against one or more accounts, e.g. p=
assword<br>
&gt; =C2=A0=C2=A0 guessing), or when client behaviour caused sshd to crash =
(possibly<br>
&gt; =C2=A0=C2=A0 indicating attempts to exploit bugs in sshd).<br>
&gt; <br>
&gt; =C2=A0=C2=A0 When such a condition is observed, sshd will record a pen=
alty of<br>
&gt; =C2=A0=C2=A0 some duration (e.g. 30 seconds) against the client&#39;s =
address. If<br>
&gt; =C2=A0=C2=A0 this time is above a minimum configurable threshold, then=
 all<br>
&gt; =C2=A0=C2=A0 connections from the client address will be refused (alon=
g with<br>
&gt; any<br>
&gt; =C2=A0=C2=A0 others in the same PerSourceNetBlockSize CIDR range) unti=
l the<br>
&gt; =C2=A0=C2=A0 penalty expire.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 Repeated offenses by the same client address will accrue =
greater<br>
&gt; =C2=A0=C2=A0 penalties, up to a configurable maximum. Address ranges m=
ay be<br>
&gt; =C2=A0=C2=A0 fully exempted from penalties, e.g. to guarantee access f=
rom a set<br>
&gt; =C2=A0=C2=A0 of trusted management addresses, using the new sshd_confi=
g(5)<br>
&gt; =C2=A0=C2=A0 PerSourcePenaltyExemptList option.<br>
&gt; <br>
&gt; =C2=A0=C2=A0 We hope these options will make it significantly more dif=
ficult<br>
&gt; for<br>
&gt; =C2=A0=C2=A0 attackers to find accounts with weak/guessable passwords =
or<br>
&gt; exploit<br>
&gt; =C2=A0=C2=A0 bugs in sshd(8) itself. This option is enabled by default=
.<br>
&gt; <br>
&gt; =C2=A0* ssh(8): allow the HostkeyAlgorithms directive to disable the<b=
r>
&gt; =C2=A0=C2=A0 implicit fallback from certificate host key to plain host=
 keys.<br>
&gt; <br>
&gt; Bugfixes<br>
&gt; --------<br>
&gt; <br>
&gt; =C2=A0* misc: fix a number of inaccuracies in the PROTOCOL.*<br>
&gt; =C2=A0=C2=A0 documentation files. GHPR430 GHPR487<br>
&gt; <br>
&gt; =C2=A0* all: switch to strtonum(3) for more robust integer parsing in =
most<br>
&gt; =C2=A0=C2=A0 places.<br>
&gt; <br>
&gt; =C2=A0* ssh(1), sshd(8): correctly restore sigprocmask around ppoll()<=
br>
&gt; <br>
&gt; =C2=A0* ssh-keysign(8): stricter validation of messaging socket fd GHP=
R492<br>
&gt; <br>
&gt; =C2=A0* sftp(1): flush stdout after writing &quot;sftp&gt;&quot; promp=
t when not using<br>
&gt; =C2=A0=C2=A0 editline. GHPR480<br>
&gt; <br>
&gt; =C2=A0* sftp-server(8): fix home-directory extension implementation, i=
t<br>
&gt; =C2=A0=C2=A0 previously always returned the current user&#39;s home di=
rectory<br>
&gt; =C2=A0=C2=A0 contrary to the spec. GHPR477<br>
&gt; <br>
&gt; =C2=A0* ssh-keyscan(1): do not close stdin to prevent error messages w=
hen<br>
&gt; =C2=A0=C2=A0 stdin is read multiple times. E.g.<br>
&gt; =C2=A0=C2=A0 echo localhost | ssh-keyscan -f - -f -<br>
&gt; <br>
&gt; =C2=A0* regression tests: fix rekey test that was testing the same KEX=
<br>
&gt; =C2=A0=C2=A0 algorithm repeatedly instead of testing all of them. bz36=
92<br>
&gt; <br>
&gt; =C2=A0* ssh_config(5), sshd_config(5): clarify the KEXAlgorithms direc=
tive<br>
&gt; =C2=A0=C2=A0 documentation, especially around what is supported vs ava=
ilable.<br>
&gt; =C2=A0=C2=A0 bz3701.<br>
&gt; <br>
&gt; Portability<br>
&gt; -----------<br>
&gt; <br>
&gt; =C2=A0* sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules<br>
&gt; =C2=A0=C2=A0 unconditionally. The previous behaviour was to expose it =
only when<br>
&gt; =C2=A0=C2=A0 particular authentication methods were in use.<br>
&gt; <br>
&gt; =C2=A0* build: fix OpenSSL ED25519 support detection. An incorrect<br>
&gt; function<br>
&gt; =C2=A0=C2=A0 signature in <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> previously prevented enabling the=
<br>
&gt; recently<br>
&gt; =C2=A0=C2=A0 added support for ED25519 private keys in PEM PKCS8 forma=
t.<br>
&gt; <br>
&gt; =C2=A0* ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLA=
Y<br>
&gt; =C2=A0=C2=A0 environment variable to enable SSH_ASKPASS, similarly to =
the X11<br>
&gt; =C2=A0=C2=A0 DISPLAY environment variable. GHPR479<br>
&gt; <br>
&gt; =C2=A0* build: improve detection of the -fzero-call-used-regs compiler=
<br>
&gt; =C2=A0=C2=A0 flag. bz3673.<br>
&gt; <br>
&gt; =C2=A0* build: relax OpenSSL version check to accept all OpenSSL 3.x<b=
r>
&gt; =C2=A0=C2=A0 versions.<br>
&gt; <br>
&gt; =C2=A0* sshd(8): add support for notifying systemd on server listen an=
d<br>
&gt; =C2=A0=C2=A0 reload, using a standalone implementation that doesn&#39;=
t depend on<br>
&gt; =C2=A0=C2=A0 libsystemd. bz2641<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v2:<br>
&gt; =C2=A0- fix musl build<br>
&gt; =C2=A0- fix sshd-session packing on openssh-sshd<br>
&gt; =C2=A0- rebase on top of the CVE-2024-6387 fix sent<br>
<br>
Thanks for the fixes. Unfortunately I think there is still one issue<br>
remaining as the openssh ptests appear to be hanging on both arm and<br>
x86:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/6600" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/6600</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6778" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6778</a><br>
<br>
On a previous build run I ended up stopping them after 24h+ but I<br>
wasn&#39;t sure if that was related to other issues with the update or not.=
<br>
It now looks like it is a separate issue :(<br></blockquote><div><br></div>=
<div>I will take a look on this ptests=C2=A0failings.</div><div>Thanks for =
reporting.</div></div></div></blockquote><div><br></div><div>I will only be=
 able to return to this next week.<br>I took a quick look at the ptest but =
I still didn&#39;t understand what was wrong.<br>If anyone wants to continu=
e this feel free.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201599): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201599" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201599</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107036805/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107036805/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000000681d4061cccc90f--

