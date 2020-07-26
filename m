Subject: recipes-devtools/gcc: gcc-Fix-argument-list-too-long-error.patch is buggy
To: openembedded-core@lists.openembedded.org
From: qiuguang.zqg@alibaba-inc.com
X-Originating-Location: Shanghai, CN (101.86.139.168)
X-Originating-Platform: Mac Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 26 Jul 2020 08:20:55 -0700
Message-ID: <G4Ph.1595776855082351500.T0aS@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IcRcLF4hKQPVWtHgm702"

--IcRcLF4hKQPVWtHgm702
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

A few days ago, I tried to compile a gcc plugin with the toolchain from po=
ky sdk.
It failed with errors about missing header files such as backend.h etc.

After investigation, I found that the problem was brought by a gcc patch:
0012-gcc-Fix-argument-list-too-long-error.patch ( https://git.yoctoproject=
.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fi=
x-argument-list-too-long-error.patch ) (which is considered derived from th=
e original patch ( https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/met=
a/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch?h=3Dyocto-1=
.4.1 ) )

- headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr =
' ' '\012' | sort -u`; \
+ headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; =
\

It changes the commands of install-plugin , making the sorting taken effec=
t before the shell globs.
Thus results in the header files under gcc $(srcdir) being not installed.

By checking log.do_install , we can find that the ` headers=3D ' statement=
 to run is incorrect and will not work as expected:
headers=3D" $(cd *.def) *.h../../../../../../../work-shared/gcc-10.1.0-r0/=
gcc-10.1.0/gcc/../include/ansidecl.h ...

As the patch says,
"The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle it=
, ..."
my suggestion is that we can simply take care of PLUGIN_HEADERS :

- headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr =
' ' '\012' | sort -u`; \
+ headers=3D `echo $(sort $(PLUGIN_HEADERS) ) $$(cd $(srcdir); echo *.h *.=
def) | tr ' ' '\012' | sort -u`; \

Thanks,
Zhuang

--IcRcLF4hKQPVWtHgm702
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />A few days ago, I tried to compile a gcc plugin with the =
toolchain from poky sdk.<br />It failed with errors about missing header fi=
les such as <em>backend.h</em> etc.<br />
<div><br />After investigation, I found that the problem was brought by a =
gcc patch:<br /><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/=
tree/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long=
-error.patch" target=3D"_blank" rel=3D"noopener">0012-gcc-Fix-argument-list=
-too-long-error.patch</a>&nbsp;(which is considered derived from the origin=
al <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/rec=
ipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch?h=3Dyocto-1.4.1"=
 target=3D"_blank" rel=3D"noopener">patch</a>)<br /><br /></div>
<div><em>-<span style=3D"white-space: pre;"> </span>headers=3D`echo $(PLUG=
IN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \<=
/em></div>
<div><em>+<span style=3D"white-space: pre;"> </span>headers=3D"$(sort $(PL=
UGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \</em><br /><br />It chan=
ges the commands of <em>install-plugin</em>, making the sorting taken effec=
t before the shell globs.<br />Thus results in the header files under gcc <=
em>$(srcdir)</em>&nbsp;being not installed.<br /><br />By checking <em>log.=
do_install</em>, we can find that the `<em>headers=3D</em>' statement to ru=
n is incorrect and will not work as expected:<br /><em>headers=3D"<span sty=
le=3D"color: #ff0000;">$(cd *.def) *.h</span> ../../../../../../../work-sha=
red/gcc-10.1.0-r0/gcc-10.1.0/gcc/../include/ansidecl.h ...</em><br /><br />=
As the patch says,<br />
<div><em>"The PLUGIN_HEADERS is too long before sort, so the "echo" can't =
handle it, ..."</em></div>
my suggestion is that we can simply take care of&nbsp;<em>PLUGIN_HEADERS</=
em>:<br />
<div style=3D"line-height: 1.42857;"><em><br />-<span style=3D"white-space=
: pre;"> </span>headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h=
 *.def) | tr ' ' '\012' | sort -u`; \</em></div>
<div style=3D"line-height: 1.42857;"><em>+<span style=3D"white-space: pre;=
"> </span>headers=3D</em><em>`echo <span style=3D"color: #ff0000;">$(sort</=
span> $(PLUGIN_HEADERS)<span style=3D"color: #ff0000;">)</span> $$(cd $(src=
dir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \<br /><br /></em><br />T=
hanks,</div>
Zhuang</div>

--IcRcLF4hKQPVWtHgm702--
