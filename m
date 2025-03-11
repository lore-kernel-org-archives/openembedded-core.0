Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF77FC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:15:31 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.10188.1741702525195846791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 07:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout08.t-online.de (Postfix) with SMTP id AA32C111F;
	Tue, 11 Mar 2025 15:15:22 +0100 (CET)
Received: from [192.168.178.20] ([79.219.226.59]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ts0O9-4E18Ii0; Tue, 11 Mar 2025 15:15:21 +0100
Date: Tue, 11 Mar 2025 15:16:07 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib-2.0: update 2.82.4 -> 2.84.0
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Message-Id: <VAQYSS.10I1DUCUOUO4@t-online.de>
In-Reply-To: <182B144118A90ED3.31525@lists.openembedded.org>
References: <20250307163724.3459192-1-f_l_k@t-online.de>
	<3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
	<182B144118A90ED3.31525@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wUZkZ9R6HQpyfV/2bDL2"
X-TOI-EXPURGATEID: 150726::1741702521-AC7FE59D-BF770BA1/0/0 CLEAN NORMAL
X-TOI-MSGID: 21983eed-693b-490c-9af7-5eb6df99c7e6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 14:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212572

--=-wUZkZ9R6HQpyfV/2bDL2
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

Here is what I found out after looking at the problem with the glib=20
ptest
I did run the ptest on my yocto-based image booted from an USB drive=20
like this:

sudo ptest-runner glib-2.0 > glib.log

There were two faulty tests

SUMMARY: total=3D291; passed=3D289; skipped=3D0; failed=3D2; user=3D233.4s;=
=20
system=3D126.5s; maxrss=3D516636
FAIL: glib/gi-compile-repository.py.test (Child process exited with=20
code 1)
FAIL: glib/static-link.test (Child process exited with code 1)

As for the first issue, I think the main problem is that the files in=20
/usr/share/gir-1.0 are not installed and thus
the compilation test fails:

Running test: glib/gi-compile-repository.py.test
TAP version 13
ok 1 __main__.TestGICompileRepository.test_open_failure
# gir path set to [PosixPath('/usr/share/gir-1.0'),=20
PosixPath('/usr/share/gir-1.0')]
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmphbnveywd
# Running: ['/bin/gi-compile-repository', 'this-is/not/a-file.gir',=20
'--output', '/tmp/tmphbnveywd/invalid.typelib']
# Return code: 1
# Output:
#
# Error:
#  Error parsing file =E2=80=98this-is/not/a-file.gir=E2=80=99: Failed to o=
pen file=20
=E2=80=9Cthis-is/not/a-file.gir=E2=80=9D: No such file or directory
not ok 2 __main__.TestGICompileRepositoryForGLib.test_compile
# gir path set to [PosixPath('/usr/share/gir-1.0'),=20
PosixPath('/usr/share/gir-1.0')]
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmpe1jgjuiz
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 98,=20
in test_compile
          result =3D self.runTestProgram(argv)
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      AssertionError: Could not find GLib-2.0.gir in=20
[PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
  ...
not ok 3 __main__.TestGICompileRepositoryForGLib.test_write_failure
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmpuw8gkqkv
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 85,=20
in test_write_failure
          result =3D self.runTestProgram(
              ["--output", typelib_path],
              should_fail=3DTrue,
          )
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      AssertionError: Could not find GLib-2.0.gir in=20
[PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
  ...
not ok 4 __main__.TestGICompileRepositoryForGObject.test_compile
# gir path set to [PosixPath('/usr/share/gir-1.0'),=20
PosixPath('/usr/share/gir-1.0')]
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmphw3q1vf2
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 98,=20
in test_compile
          result =3D self.runTestProgram(argv)
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      AssertionError: Could not find GObject-2.0.gir in=20
[PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
  ...
not ok 5 __main__.TestGICompileRepositoryForGObject.test_write_failure
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmp2ad5g34h
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 85,=20
in test_write_failure
          result =3D self.runTestProgram(
              ["--output", typelib_path],
              should_fail=3DTrue,
          )
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      AssertionError: Could not find GObject-2.0.gir in=20
[PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
  ...
not ok 6 __main__.TestGICompileRepositoryForGio.test_compile
# gir path set to [PosixPath('/usr/share/gir-1.0'),=20
PosixPath('/usr/share/gir-1.0')]
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmp5shfyrv4
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 98,=20
in test_compile
          result =3D self.runTestProgram(argv)
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      AssertionError: Could not find Gio-2.0.gir in=20
[PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
  ...
not ok 7 __main__.TestGICompileRepositoryForGio.test_write_failure
# gi-compile-repository: /bin/gi-compile-repository
# tmpdir: /tmp/tmpzl3y3tcj
  ---
    message: |
      Traceback (most recent call last):
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 85,=20
in test_write_failure
          result =3D self.runTestProgram(
              ["--output", typelib_path],
              should_fail=3DTrue,
          )
        File=20
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72,=20
in runTestProgram
          self.fail(f"Could not find {self.GIR_NAME}.gir in=20
{self._gir_paths}")
         =20
~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      Assertion

Adding IMAGE_INSTALL:append =3D =E2=80=9C glib-2.0-dev=E2=80=9D to local.co=
nf fixed=20
the problem
I'm pretty confident that this was enough, but I'm not entirely sure=20
though, as I'm running in my local build with
updated gobject-introspection and, to unbreak vapi, also with updated=20
vala.

For the second failed test I assume that it was already broken before=20
and the fail is reasonable ?

This test is bloated. It compiles glib and tries to link it statically.
Since it has heavy runtime requirements (pkgconfig meson ninja gcc and=20
all glib dependencies with support for static)
it is guarded by an env variable GLIB_TEST_COMPILATION

If thats not in env (the current state) the test doesn't do anything=20
but exits with '77'.
<https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/tests/static-link.py#L=
35>

test can be activated by editing glib run-ptest file like this:
su glib2-test -c 'G_TEST_TMPDIR=3D`readlink -f /tmp`=20
GLIB_TEST_COMPILATION=3D1 gnome-desktop-testing-runner glib'

The test then compiles glib and fails because it cannot find any=20
statically linked libraries.
Source dir: /usr/libexec/installed-tests/glib/static-link
Build dir: /tmp/tmpvt9w2_ri
Build type: native build
Project name: test-static-link
Project version: undefined
C compiler for the host machine: ccache cc (gcc 14.2.0 "cc (GCC)=20
14.2.0")
C linker for the host machine: cc ld.bfd 2.44
Host machine cpu family: x86_64
Host machine cpu: x86_64
Found pkg-config: YES (/bin/pkg-config) 0.29.2
WARNING: Static library 'gio-2.0' not found for dependency 'gio-2.0',=20
may not be statically linked
WARNING: Static library 'gmodule-2.0' not found for dependency=20
'gio-2.0', may not be statically linked
WARNING: Static library 'z' not found for dependency 'gio-2.0', may not=20
be statically linked
WARNING: Static library 'mount' not found for dependency 'gio-2.0', may=20
not be statically linked
WARNING: Static library 'blkid' not found for dependency 'gio-2.0', may=20
not be statically linked
WARNING: Static library 'gobject-2.0' not found for dependency=20
'gio-2.0', may not be statically linked
WARNING: Static library 'ffi' not found for dependency 'gio-2.0', may=20
not be statically linked
WARNING: Static library 'glib-2.0' not found for dependency 'gio-2.0',=20
may not be statically linked
WARNING: Static library 'atomic' not found for dependency 'gio-2.0',=20
may not be statically linked
WARNING: Static library 'pcre2-8' not found for dependency 'gio-2.0',=20
may not be statically linked
Run-time dependency gio-2.0 found: YES 2.84.0
Build targets in project: 1

Found ninja-1.12.1 at /bin/ninja
WARNING: Running the setup command as `meson [options]` instead of=20
`meson setup [options]` is ambiguous and deprecated.
ninja: Entering directory `/tmp/tmpvt9w2_ri'
[1/3] Compiling C object test-static-link.p/app.c.o
[2/3] Linking target test-static-link
[2/3] Running all tests
1/1 test-static-link OK              0.00s

Ok:                 1
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Full log written to /tmp/tmpvt9w2_ri/meson-logs/testlog.txt
test-static-link is dynamically linked on libgio
FAIL: glib/static-link.test (Child process exited with code 1)

I assume that's reasonable because we dont support it?

On Sun, Mar 9 2025 at 09:13:10 +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> Yes, sorry.
>=20
> v2 fixed only the installed-vs-shipped issue I have seen if building=20
> without PACKAGECONFIG[test]
>=20
> I'll have a look at the ptest issue tomorrow.
>=20
> On Sat, Mar 8 2025 at 18:07:12 +00:00:00, Richard Purdie via=20
> lists.openembedded.org=20
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via=20
>> lists.openembedded.org wrote:
>>>  - Add option for tests to prevent them from being built without
>>>  PACKAGECONFIG[tests] being selected
>>=20
>> The v2 still has ptest failures:
>>=20
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1074=
>
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1077=
>
>>=20
>> Cheers,
>>=20
>> Richard
>>=20


--=-wUZkZ9R6HQpyfV/2bDL2
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>Here is what I found out afte=
r looking at the problem with the glib ptest</div><div>I did run the ptest =
on my yocto-based image booted from an USB drive like this:</div><div><br><=
/div><div>sudo ptest-runner glib-2.0 &gt; glib.log</div><div><br></div><div=
>There were two faulty tests</div><div><br></div><div>SUMMARY: total=3D291;=
 passed=3D289; skipped=3D0; failed=3D2; user=3D233.4s; system=3D126.5s; max=
rss=3D516636</div><div>FAIL: glib/gi-compile-repository.py.test (Child proc=
ess exited with code 1)</div><div>FAIL: glib/static-link.test (Child proces=
s exited with code 1)</div><div><br></div><div>As for the first issue, I th=
ink the main problem is that the files in /usr/share/gir-1.0 are not instal=
led and thus</div><div>the compilation test fails:&nbsp;</div><div><br></di=
v><div>Running test: glib/gi-compile-repository.py.test</div><div>TAP versi=
on 13</div><div>ok 1 __main__.TestGICompileRepository.test_open_failure</di=
v><div># gir path set to [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/=
share/gir-1.0')]</div><div># gi-compile-repository: /bin/gi-compile-reposit=
ory</div><div># tmpdir: /tmp/tmphbnveywd</div><div># Running: ['/bin/gi-com=
pile-repository', 'this-is/not/a-file.gir', '--output', '/tmp/tmphbnveywd/i=
nvalid.typelib']</div><div># Return code: 1</div><div># Output:</div><div>#=
 &nbsp;</div><div># Error:</div><div># &nbsp;Error parsing file =E2=80=98th=
is-is/not/a-file.gir=E2=80=99: Failed to open file =E2=80=9Cthis-is/not/a-f=
ile.gir=E2=80=9D: No such file or directory</div><div>not ok 2 __main__.Tes=
tGICompileRepositoryForGLib.test_compile</div><div># gir path set to [Posix=
Path('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]</div><div># gi=
-compile-repository: /bin/gi-compile-repository</div><div># tmpdir: /tmp/tm=
pe1jgjuiz</div><div>&nbsp; ---</div><div>&nbsp; &nbsp; message: |</div><div=
>&nbsp; &nbsp; &nbsp; Traceback (most recent call last):</div><div>&nbsp; &=
nbsp; &nbsp; &nbsp; File "/usr/libexec/installed-tests/glib/gi-compile-repo=
sitory.py", line 98, in test_compile</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; result =3D self.runTestProgram(argv)</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; File "/usr/libexec/installed-tests/glib/gi-compile-repository.py", l=
ine 72, in runTestProgram</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self=
.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_paths}")</div><div=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</div><div>&nbsp; &nbsp; &nbsp; AssertionErro=
r: Could not find GLib-2.0.gir in [PosixPath('/usr/share/gir-1.0'), PosixPa=
th('/usr/share/gir-1.0')]</div><div>&nbsp; ...</div><div>not ok 3 __main__.=
TestGICompileRepositoryForGLib.test_write_failure</div><div># gi-compile-re=
pository: /bin/gi-compile-repository</div><div># tmpdir: /tmp/tmpuw8gkqkv</=
div><div>&nbsp; ---</div><div>&nbsp; &nbsp; message: |</div><div>&nbsp; &nb=
sp; &nbsp; Traceback (most recent call last):</div><div>&nbsp; &nbsp; &nbsp=
; &nbsp; File "/usr/libexec/installed-tests/glib/gi-compile-repository.py",=
 line 85, in test_write_failure</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; result =3D self.runTestProgram(</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; ["--output", typelib_path],</div><div>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; should_fail=3DTrue,</div><div>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; )</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File "/usr/libe=
xec/installed-tests/glib/gi-compile-repository.py", line 72, in runTestProg=
ram</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.fail(f"Could not find=
 {self.GIR_NAME}.gir in {self._gir_paths}")</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^</div><div>&nbsp; &nbsp; &nbsp; AssertionError: Could not find GLib=
-2.0.gir in [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0=
')]</div><div>&nbsp; ...</div><div>not ok 4 __main__.TestGICompileRepositor=
yForGObject.test_compile</div><div># gir path set to [PosixPath('/usr/share=
/gir-1.0'), PosixPath('/usr/share/gir-1.0')]</div><div># gi-compile-reposit=
ory: /bin/gi-compile-repository</div><div># tmpdir: /tmp/tmphw3q1vf2</div><=
div>&nbsp; ---</div><div>&nbsp; &nbsp; message: |</div><div>&nbsp; &nbsp; &=
nbsp; Traceback (most recent call last):</div><div>&nbsp; &nbsp; &nbsp; &nb=
sp; File "/usr/libexec/installed-tests/glib/gi-compile-repository.py", line=
 98, in test_compile</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; result =
=3D self.runTestProgram(argv)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File "/=
usr/libexec/installed-tests/glib/gi-compile-repository.py", line 72, in run=
TestProgram</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.fail(f"Could =
not find {self.GIR_NAME}.gir in {self._gir_paths}")</div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^</div><div>&nbsp; &nbsp; &nbsp; AssertionError: Could not f=
ind GObject-2.0.gir in [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/sh=
are/gir-1.0')]</div><div>&nbsp; ...</div><div>not ok 5 __main__.TestGICompi=
leRepositoryForGObject.test_write_failure</div><div># gi-compile-repository=
: /bin/gi-compile-repository</div><div># tmpdir: /tmp/tmp2ad5g34h</div><div=
>&nbsp; ---</div><div>&nbsp; &nbsp; message: |</div><div>&nbsp; &nbsp; &nbs=
p; Traceback (most recent call last):</div><div>&nbsp; &nbsp; &nbsp; &nbsp;=
 File "/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 85=
, in test_write_failure</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; result=
 =3D self.runTestProgram(</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ["--output", typelib_path],</div><div>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; should_fail=3DTrue,</div><div>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; )</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File "/usr/libexec/inst=
alled-tests/glib/gi-compile-repository.py", line 72, in runTestProgram</div=
><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.fail(f"Could not find {self.G=
IR_NAME}.gir in {self._gir_paths}")</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
</div><div>&nbsp; &nbsp; &nbsp; AssertionError: Could not find GObject-2.0.=
gir in [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]</=
div><div>&nbsp; ...</div><div>not ok 6 __main__.TestGICompileRepositoryForG=
io.test_compile</div><div># gir path set to [PosixPath('/usr/share/gir-1.0'=
), PosixPath('/usr/share/gir-1.0')]</div><div># gi-compile-repository: /bin=
/gi-compile-repository</div><div># tmpdir: /tmp/tmp5shfyrv4</div><div>&nbsp=
; ---</div><div>&nbsp; &nbsp; message: |</div><div>&nbsp; &nbsp; &nbsp; Tra=
ceback (most recent call last):</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File =
"/usr/libexec/installed-tests/glib/gi-compile-repository.py", line 98, in t=
est_compile</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; result =3D self.ru=
nTestProgram(argv)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File "/usr/libexec=
/installed-tests/glib/gi-compile-repository.py", line 72, in runTestProgram=
</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.fail(f"Could not find {s=
elf.GIR_NAME}.gir in {self._gir_paths}")</div><div>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^</div><div>&nbsp; &nbsp; &nbsp; AssertionError: Could not find Gio-2.0=
.gir in [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]<=
/div><div>&nbsp; ...</div><div>not ok 7 __main__.TestGICompileRepositoryFor=
Gio.test_write_failure</div><div># gi-compile-repository: /bin/gi-compile-r=
epository</div><div># tmpdir: /tmp/tmpzl3y3tcj</div><div>&nbsp; ---</div><d=
iv>&nbsp; &nbsp; message: |</div><div>&nbsp; &nbsp; &nbsp; Traceback (most =
recent call last):</div><div>&nbsp; &nbsp; &nbsp; &nbsp; File "/usr/libexec=
/installed-tests/glib/gi-compile-repository.py", line 85, in test_write_fai=
lure</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; result =3D self.runTestPr=
ogram(</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ["--outpu=
t", typelib_path],</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; should_fail=3DTrue,</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; )</div>=
<div>&nbsp; &nbsp; &nbsp; &nbsp; File "/usr/libexec/installed-tests/glib/gi=
-compile-repository.py", line 72, in runTestProgram</div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; self.fail(f"Could not find {self.GIR_NAME}.gir in {se=
lf._gir_paths}")</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~~~~~~~~~^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</div><div>&nbsp; &=
nbsp; &nbsp; Assertion</div><div>&nbsp; &nbsp; &nbsp;&nbsp;</div><div>Addin=
g IMAGE_INSTALL:append =3D =E2=80=9C glib-2.0-dev=E2=80=9D to local.conf fi=
xed the problem</div><div>I'm pretty confident that this was enough, but I'=
m not entirely sure though, as I'm running in my local build with</div><div=
>updated gobject-introspection and, to unbreak vapi, also with updated vala=
.</div><div><br></div><div>For the second failed test I assume that it was =
already broken before and the fail is reasonable ?</div><div><br></div><div=
>This test is bloated. It compiles glib and tries to link it statically.</d=
iv><div>Since it has heavy runtime requirements (pkgconfig meson ninja gcc =
and all glib dependencies with support for static)</div><div>it is guarded =
by an env variable GLIB_TEST_COMPILATION</div><div><br></div><div>If thats =
not in env (the current state) the test doesn't do anything but exits with =
'77'.</div><div><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/blob/main/=
gio/tests/static-link.py#L35">https://gitlab.gnome.org/GNOME/glib/-/blob/ma=
in/gio/tests/static-link.py#L35</a></div><div><br></div><div>test can be ac=
tivated by editing glib run-ptest file like this:</div><div>su glib2-test -=
c 'G_TEST_TMPDIR=3D`readlink -f /tmp` GLIB_TEST_COMPILATION=3D1 gnome-deskt=
op-testing-runner glib'</div><div><br></div><div>The test then compiles gli=
b and fails because it cannot find any statically linked libraries.</div><d=
iv>Source dir: /usr/libexec/installed-tests/glib/static-link</div><div>Buil=
d dir: /tmp/tmpvt9w2_ri</div><div>Build type: native build</div><div>Projec=
t name: test-static-link</div><div>Project version: undefined</div><div>C c=
ompiler for the host machine: ccache cc (gcc 14.2.0 "cc (GCC) 14.2.0")</div=
><div>C linker for the host machine: cc ld.bfd 2.44</div><div>Host machine =
cpu family: x86_64</div><div>Host machine cpu: x86_64</div><div>Found pkg-c=
onfig: YES (/bin/pkg-config) 0.29.2</div><div>WARNING: Static library 'gio-=
2.0' not found for dependency 'gio-2.0', may not be statically linked</div>=
<div>WARNING: Static library 'gmodule-2.0' not found for dependency 'gio-2.=
0', may not be statically linked</div><div>WARNING: Static library 'z' not =
found for dependency 'gio-2.0', may not be statically linked</div><div>WARN=
ING: Static library 'mount' not found for dependency 'gio-2.0', may not be =
statically linked</div><div>WARNING: Static library 'blkid' not found for d=
ependency 'gio-2.0', may not be statically linked</div><div>WARNING: Static=
 library 'gobject-2.0' not found for dependency 'gio-2.0', may not be stati=
cally linked</div><div>WARNING: Static library 'ffi' not found for dependen=
cy 'gio-2.0', may not be statically linked</div><div>WARNING: Static librar=
y 'glib-2.0' not found for dependency 'gio-2.0', may not be statically link=
ed</div><div>WARNING: Static library 'atomic' not found for dependency 'gio=
-2.0', may not be statically linked</div><div>WARNING: Static library 'pcre=
2-8' not found for dependency 'gio-2.0', may not be statically linked</div>=
<div>Run-time dependency gio-2.0 found: YES 2.84.0</div><div>Build targets =
in project: 1</div><div><br></div><div>Found ninja-1.12.1 at /bin/ninja</di=
v><div>WARNING: Running the setup command as `meson [options]` instead of `=
meson setup [options]` is ambiguous and deprecated.</div><div>ninja: Enteri=
ng directory `/tmp/tmpvt9w2_ri'</div><div>[1/3] Compiling C object test-sta=
tic-link.p/app.c.o</div><div>[2/3] Linking target test-static-link</div><di=
v>[2/3] Running all tests</div><div>1/1 test-static-link OK &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.00s</div><div><br></div><div>Ok: &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1</div><div>Expected Fail:=
 &nbsp; &nbsp; &nbsp;0</div><div>Fail: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 0</div><div>Unexpected Pass: &nbsp; &nbsp;0</div><div>Skipped:=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</div><div>Timeout: &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;0</div><div><br></div><div>Full log written to=
 /tmp/tmpvt9w2_ri/meson-logs/testlog.txt</div><div>test-static-link is dyna=
mically linked on libgio</div><div>FAIL: glib/static-link.test (Child proce=
ss exited with code 1)</div><div><br></div><div>I assume that's reasonable =
because we dont support it?</div></div></div><div id=3D"geary-quote" dir=3D=
"auto"><br>On Sun, Mar 9 2025 at 09:13:10 +01:00:00, Markus Volk &lt;f_l_k@=
t-online.de&gt; wrote:<br><blockquote type=3D"cite"><div id=3D"geary-body" =
dir=3D"auto"><div>Yes, sorry.</div><div><br></div><div>v2 fixed only the in=
stalled-vs-shipped issue I have seen if building without PACKAGECONFIG[test=
]</div><div><br></div><div>I'll have a look at the ptest issue tomorrow.</d=
iv></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sat, Mar 8 2025 at 18:=
07:12 +00:00:00, Richard Purdie via lists.openembedded.org &lt;richard.purd=
ie=3Dlinuxfoundation.org@lists.openembedded.org&gt; wrote:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via lists.openembedded.org w=
rote:
<blockquote> - Add option for tests to prevent them from being built withou=
t
 PACKAGECONFIG[tests] being selected
</blockquote>
The v2 still has ptest failures:

<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/1074">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds=
/1074</a>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/1077">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds=
/1077</a>

Cheers,

Richard
</div></blockquote><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;"><br></div></blockquote></div>
</blockquote></div>
--=-wUZkZ9R6HQpyfV/2bDL2--


