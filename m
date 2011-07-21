Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjyTW-0005Si-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:59:58 +0200
Received: by pvf24 with SMTP id 24so1363538pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dOmjgM3XkE+7eaY0hO6/4B3IzoTi7X9SrDFpHG2q7GI=;
	b=n0eFEnTnLtzYYo6tmnnPN2aGCWn5n0qzbFWit9gRjnJ7H0126g00SO1a2ODvfqag81
	BsNRNvfbQcl/MsWn0JjHb+lQ4i3oq1ZMzLO8vNkfG28ooGN4GtPaC9TVqDC2RdemDYDw
	vHkollVFZuC9YPaNQV7QtPpGMl/aiaM+kHrvQ=
Received: by 10.68.9.165 with SMTP id a5mr781027pbb.412.1311274549095; Thu, 21
	Jul 2011 11:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 11:55:19 -0700 (PDT)
In-Reply-To: <db0eff4b964055b18ca5f91e55b7cf0d4a55c832.1311240498.git.nitin.a.kamble@intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
	<db0eff4b964055b18ca5f91e55b7cf0d4a55c832.1311240498.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 11:55:19 -0700
Message-ID: <CAMKF1so0578NyAxcwxcsw344-jmfp1otUJ+w++fCumszVsJxbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python: fix security vulnerability
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 18:59:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 2:29 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This Fixes bug: [Yocto #1254]
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2011-1015
>
> Issue #2254: Fix CGIHTTPServer information disclosure. =C2=A0Relative pat=
hs are
> =C2=A0now collapsed within the url properly before looking in cgi_directo=
ries.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0meta/recipes-devtools/python/python.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../python/python/security_issue_2254_fix.patch =C2=A0 =C2=A0| =C2=
=A0184 ++++++++++++++++++++
> =C2=A0meta/recipes-devtools/python/python_2.6.6.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A03 +-
> =C2=A03 files changed, 187 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python/security_iss=
ue_2254_fix.patch
>
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devto=
ols/python/python.inc
> index 25a458e..a6cc917 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.python.org"
> =C2=A0LICENSE =3D "PSF"
> =C2=A0SECTION =3D "devel/python"
> =C2=A0# bump this on every change in contrib/python/generate-manifest-2.6=
.py
> -INC_PR =3D "nk2"
> +INC_PR =3D "r2"
>
> =C2=A0DEFAULT_PREFERENCE =3D "-26"
>
> diff --git a/meta/recipes-devtools/python/python/security_issue_2254_fix.=
patch b/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
> new file mode 100644
> index 0000000..0d2274a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
> @@ -0,0 +1,184 @@
> +UpstreamStatus: Backport

This should be Upstream-Status I guess to match other patches that
said there are few more anomalies

meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patc=
h:
"Upstream Status"
meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch:Upstream=
Status:
Pending
meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch:UpstreamStatu=
s:
pending


> +http://svn.python.org/view?view=3Drevision&revision=3D71303
> +
> +Issue #2254: Fix CGIHTTPServer information disclosure. =C2=A0Relative pa=
ths are
> + =C2=A0now collapsed within the url properly before looking in cgi_direc=
tories.
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2011/07/19
> +
> +Index: Python-2.6.6/Lib/CGIHTTPServer.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.6.orig/Lib/CGIHTTPServer.py
> ++++ Python-2.6.6/Lib/CGIHTTPServer.py
> +@@ -70,27 +70,20 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SimpleHTTPServer.Simpl=
eHTTPRequestHandler.send_head(self)
> +
> + =C2=A0 =C2=A0 def is_cgi(self):
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0"""Test whether self.path corresponds to a =
CGI script,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0and return a boolean.
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0"""Test whether self.path corresponds to a =
CGI script.
> +
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0This function sets self.cgi_info to a tuple=
 (dir, rest)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0when it returns True, where dir is the dire=
ctory part before
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0the CGI script name. =C2=A0Note that rest b=
egins with a
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0slash if it is not empty.
> +-
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0The default implementation tests whether th=
e path
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0begins with one of the strings in the list
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cgi_directories (and the next characte=
r is a '/'
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0or the end of the string).
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns True and updates the cgi_info attri=
bute to the tuple
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(dir, rest) if self.path requires running a=
 CGI script.
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns False otherwise.
> ++
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0The default implementation tests whether th=
e normalized url
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0path begins with one of the strings in self=
.cgi_directories
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(and the next character is a '/' or the end=
 of the string).
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 """
> +-
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D self.path
> +-
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0for x in self.cgi_directories:
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D len(x)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path[:i] =3D=3D x and (not=
 path[i:] or path[i] =3D=3D '/'):
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cgi_info =
=3D path[:i], path[i+1:]
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0splitpath =3D _url_collapse_path_split(self=
.path)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if splitpath[0] in self.cgi_directories:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cgi_info =3D splitpath
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False
> +
> + =C2=A0 =C2=A0 cgi_directories =3D ['/cgi-bin', '/htbin']
> +@@ -299,6 +292,46 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.log_messag=
e("CGI script exited OK")
> +
> +
> ++# TODO(gregory.p.smith): Move this into an appropriate library.
> ++def _url_collapse_path_split(path):
> ++ =C2=A0 =C2=A0"""
> ++ =C2=A0 =C2=A0Given a URL path, remove extra '/'s and '.' path elements=
 and collapse
> ++ =C2=A0 =C2=A0any '..' references.
> ++
> ++ =C2=A0 =C2=A0Implements something akin to RFC-2396 5.2 step 6 to parse=
 relative paths.
> ++
> ++ =C2=A0 =C2=A0Returns: A tuple of (head, tail) where tail is everything=
 after the final /
> ++ =C2=A0 =C2=A0and head is everything before it. =C2=A0Head will always =
start with a '/' and,
> ++ =C2=A0 =C2=A0if it contains anything else, never have a trailing '/'.
> ++
> ++ =C2=A0 =C2=A0Raises: IndexError if too many '..' occur within the path=
.
> ++ =C2=A0 =C2=A0"""
> ++ =C2=A0 =C2=A0# Similar to os.path.split(os.path.normpath(path)) but sp=
ecific to URL
> ++ =C2=A0 =C2=A0# path semantics rather than local operating system seman=
tics.
> ++ =C2=A0 =C2=A0path_parts =3D []
> ++ =C2=A0 =C2=A0for part in path.split('/'):
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if part =3D=3D '.':
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_parts.append('')
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_parts.append(part)
> ++ =C2=A0 =C2=A0# Filter out blank non trailing parts before consuming th=
e '..'.
> ++ =C2=A0 =C2=A0path_parts =3D [part for part in path_parts[:-1] if part]=
 + path_parts[-1:]
> ++ =C2=A0 =C2=A0if path_parts:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0tail_part =3D path_parts.pop()
> ++ =C2=A0 =C2=A0else:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0tail_part =3D ''
> ++ =C2=A0 =C2=A0head_parts =3D []
> ++ =C2=A0 =C2=A0for part in path_parts:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if part =3D=3D '..':
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0head_parts.pop()
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0head_parts.append(part)
> ++ =C2=A0 =C2=A0if tail_part and tail_part =3D=3D '..':
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0head_parts.pop()
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0tail_part =3D ''
> ++ =C2=A0 =C2=A0return ('/' + '/'.join(head_parts), tail_part)
> ++
> ++
> + nobody =3D None
> +
> + def nobody_uid():
> +Index: Python-2.6.6/Lib/test/test_httpservers.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.6.orig/Lib/test/test_httpservers.py
> ++++ Python-2.6.6/Lib/test/test_httpservers.py
> +@@ -7,6 +7,7 @@ Josip Dzolonga, and Michael Otteneder fo
> + from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
> + from SimpleHTTPServer import SimpleHTTPRequestHandler
> + from CGIHTTPServer import CGIHTTPRequestHandler
> ++import CGIHTTPServer
> +
> + import os
> + import sys
> +@@ -324,6 +325,45 @@ class CGIHTTPServerTestCase(BaseTestCase
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BaseTestCase.tearDown(self)
> +
> ++ =C2=A0 =C2=A0def test_url_collapse_path_split(self):
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0test_vectors =3D {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'': ('/', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'..': IndexError,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/.//..': IndexError,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/': ('/', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'//': ('/', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/\\': ('/', '\\'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/.//': ('/', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'cgi-bin/file1.py': ('/cgi-bi=
n', 'file1.py'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/cgi-bin/file1.py': ('/cgi-b=
in', 'file1.py'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'a': ('/', 'a'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a': ('/', 'a'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'//a': ('/', 'a'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'./a': ('/', 'a'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'./C:/': ('/C:', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b': ('/a', 'b'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/': ('/a/b', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/..': ('/a/b', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d': ('/a/b', 'd'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../f': ('/a/b/=
d', 'f'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../../f': ('/a=
/b', 'f'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/.././././..//f=
': ('/a/b', 'f'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'../a/b/c/../d/e/.././././../=
/f': IndexError,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../../../f': (=
'/a', 'f'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../../../../f'=
: ('/', 'f'),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../../../../..=
/f': IndexError,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'/a/b/c/../d/e/../../../../f/=
..': ('/', ''),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0for path, expected in test_vectors.iteritem=
s():
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(expected, type)=
 and issubclass(expected, Exception):
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertRais=
es(expected,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGIHTTPServer._url_collapse=
_path_split, path)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0actual =3D CGIH=
TTPServer._url_collapse_path_split(path)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqua=
ls(expected, actual,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg=3D'path =3D %r\nGot: =
=C2=A0 =C2=A0%r\nWanted: %r' % (
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, actual, expected))
> ++
> + =C2=A0 =C2=A0 def test_headers_and_content(self):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.request('/cgi-bin/file1.py')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(('Hello World\n', 'text/h=
tml', 200), \
> +@@ -348,6 +388,12 @@ class CGIHTTPServerTestCase(BaseTestCase
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(('Hello World\n', 'text/h=
tml', 200), \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(res.read(), res.gethea=
der('Content-type'), res.status))
> +
> ++ =C2=A0 =C2=A0def test_no_leading_slash(self):
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0# http://bugs.python.org/issue2254
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D self.request('cgi-bin/file1.py')
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEquals(('Hello World\n', 'text/h=
tml', 200),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (res.read(), res.getheader('=
Content-type'), res.status))
> ++
> +
> + def test_main(verbose=3DNone):
> + =C2=A0 =C2=A0 cwd =3D os.getcwd()
> +Index: Python-2.6.6/Misc/NEWS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.6.6.orig/Misc/NEWS
> ++++ Python-2.6.6/Misc/NEWS
> +@@ -137,6 +137,9 @@ C-API
> + Library
> + -------
> +
> ++- Issue #2254: Fix CGIHTTPServer information disclosure. =C2=A0Relative=
 paths are
> ++ =C2=A0now collapsed within the url properly before looking in cgi_dire=
ctories.
> ++
> + - Issue #8447: Make distutils.sysconfig follow symlinks in the path to
> + =C2=A0 the interpreter executable. =C2=A0This fixes a failure of test_h=
ttpservers
> + =C2=A0 on OS X.
> diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-=
devtools/python/python_2.6.6.bb
> index 800ba04..d5e7d22 100644
> --- a/meta/recipes-devtools/python/python_2.6.6.bb
> +++ b/meta/recipes-devtools/python/python_2.6.6.bb
> @@ -1,7 +1,7 @@
> =C2=A0require python.inc
> =C2=A0DEPENDS =3D "python-native db gdbm openssl readline sqlite3 zlib"
> =C2=A0DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
> -PR =3D "${INC_PR}.8"
> +PR =3D "${INC_PR}.9"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38fdd546420fab09ac6bd3d8=
a1c83eb6"
>
> =C2=A0DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> @@ -18,6 +18,7 @@ SRC_URI =3D "\
> =C2=A0 file://99-ignore-optimization-flag.patch \
> =C2=A0 ${DISTRO_SRC_URI} \
> =C2=A0 file://multilib.patch \
> + =C2=A0file://security_issue_2254_fix.patch \
> =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "cf4e6881bb84a7ce6089e4a307f71f14"
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


