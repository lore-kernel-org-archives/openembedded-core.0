Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEA667C127
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 01:59:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9G1xQfD014387
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 18:59:26 -0700 (PDT)
Received: from [128.224.158.231] (128.224.158.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 15 Oct 2019 18:59:25 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20191009083640.38909-1-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <eb3244ba-50aa-4d52-bf97-1230df065444@windriver.com>
Date: Wed, 16 Oct 2019 10:14:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191009083640.38909-1-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.158.231]
Subject: Re: [PATCH V2 1/2] python3: CVE-2019-16056
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
X-List-Received-Date: Wed, 16 Oct 2019 01:59:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please help cherry pick these two CVE fixes into zeus branch if convenient.

Best Regards,
Chen Qi

On 10/09/2019 04:36 PM, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...nt-parse-domains-containing-GH-13079.patch | 132 ++++++++++++++++++
>   meta/recipes-devtools/python/python3_3.7.4.bb |   5 +-
>   2 files changed, 135 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
> new file mode 100644
> index 0000000000..319e7ed07e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
> @@ -0,0 +1,132 @@
> +From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001
> +From: jpic <jpic@users.noreply.github.com>
> +Date: Wed, 17 Jul 2019 23:54:25 +0200
> +Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)
> +
> +Before:
> +
> +        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
> +        (Address(display_name='', username='a', domain='malicious.org'),)
> +
> +        >>> parseaddr('a@malicious.org@important.com')
> +        ('', 'a@malicious.org')
> +
> +    After:
> +
> +        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
> +        (Address(display_name='', username='', domain=''),)
> +
> +        >>> parseaddr('a@malicious.org@important.com')
> +        ('', 'a@')
> +
> +https://bugs.python.org/issue34155
> +
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
> +
> +CVE: CVE-2019-16056
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Lib/email/_header_value_parser.py                  |  2 ++
> + Lib/email/_parseaddr.py                            | 11 ++++++++++-
> + Lib/test/test_email/test__header_value_parser.py   | 10 ++++++++++
> + Lib/test/test_email/test_email.py                  | 14 ++++++++++++++
> + .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
> + 5 files changed, 37 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> +
> +diff --git a/Lib/email/_header_value_parser.py b/Lib/email/_header_value_parser.py
> +index fc00b4a098..bbc026ec71 100644
> +--- a/Lib/email/_header_value_parser.py
> ++++ b/Lib/email/_header_value_parser.py
> +@@ -1582,6 +1582,8 @@ def get_domain(value):
> +         token, value = get_dot_atom(value)
> +     except errors.HeaderParseError:
> +         token, value = get_atom(value)
> ++    if value and value[0] == '@':
> ++        raise errors.HeaderParseError('Invalid Domain')
> +     if leader is not None:
> +         token[:0] = [leader]
> +     domain.append(token)
> +diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
> +index cdfa3729ad..41ff6f8c00 100644
> +--- a/Lib/email/_parseaddr.py
> ++++ b/Lib/email/_parseaddr.py
> +@@ -379,7 +379,12 @@ class AddrlistClass:
> +         aslist.append('@')
> +         self.pos += 1
> +         self.gotonext()
> +-        return EMPTYSTRING.join(aslist) + self.getdomain()
> ++        domain = self.getdomain()
> ++        if not domain:
> ++            # Invalid domain, return an empty address instead of returning a
> ++            # local part to denote failed parsing.
> ++            return EMPTYSTRING
> ++        return EMPTYSTRING.join(aslist) + domain
> +
> +     def getdomain(self):
> +         """Get the complete domain name from an address."""
> +@@ -394,6 +399,10 @@ class AddrlistClass:
> +             elif self.field[self.pos] == '.':
> +                 self.pos += 1
> +                 sdlist.append('.')
> ++            elif self.field[self.pos] == '@':
> ++                # bpo-34155: Don't parse domains with two `@` like
> ++                # `a@malicious.org@important.com`.
> ++                return EMPTYSTRING
> +             elif self.field[self.pos] in self.atomends:
> +                 break
> +             else:
> +diff --git a/Lib/test/test_email/test__header_value_parser.py b/Lib/test/test_email/test__header_value_parser.py
> +index 693487bc96..7dc4de1b7b 100644
> +--- a/Lib/test/test_email/test__header_value_parser.py
> ++++ b/Lib/test/test_email/test__header_value_parser.py
> +@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):
> +         self.assertEqual(addr_spec.domain, 'example.com')
> +         self.assertEqual(addr_spec.addr_spec, 'star.a.star@example.com')
> +
> ++    def test_get_addr_spec_multiple_domains(self):
> ++        with self.assertRaises(errors.HeaderParseError):
> ++            parser.get_addr_spec('star@a.star@example.com')
> ++
> ++        with self.assertRaises(errors.HeaderParseError):
> ++            parser.get_addr_spec('star@a@example.com')
> ++
> ++        with self.assertRaises(errors.HeaderParseError):
> ++            parser.get_addr_spec('star@172.17.0.1@example.com')
> ++
> +     # get_obs_route
> +
> +     def test_get_obs_route_simple(self):
> +diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
> +index c29cc56203..aa775881c5 100644
> +--- a/Lib/test/test_email/test_email.py
> ++++ b/Lib/test/test_email/test_email.py
> +@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):
> +         self.assertEqual(utils.parseaddr('<>'), ('', ''))
> +         self.assertEqual(utils.formataddr(utils.parseaddr('<>')), '')
> +
> ++    def test_parseaddr_multiple_domains(self):
> ++        self.assertEqual(
> ++            utils.parseaddr('a@b@c'),
> ++            ('', '')
> ++        )
> ++        self.assertEqual(
> ++            utils.parseaddr('a@b.c@c'),
> ++            ('', '')
> ++        )
> ++        self.assertEqual(
> ++            utils.parseaddr('a@172.17.0.1@c'),
> ++            ('', '')
> ++        )
> ++
> +     def test_noquote_dump(self):
> +         self.assertEqual(
> +             utils.formataddr(('A Silly Person', 'person@dom.ain')),
> +diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> +new file mode 100644
> +index 0000000000..50292e29ed
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> +@@ -0,0 +1 @@
> ++Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
> diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
> index 8693c446c2..580f47f976 100644
> --- a/meta/recipes-devtools/python/python3_3.7.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.4.bb
> @@ -23,11 +23,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>              file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
>              file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
>              file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
> -	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
> -	   file://crosspythonpath.patch \
> +           file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
> +           file://crosspythonpath.patch \
>              file://reformat_sysconfig.py \
>              file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
>              file://0001-test_locale.py-correct-the-test-output-format.patch \
> +           file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
>              "
>   
>   SRC_URI_append_class-native = " \



