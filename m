Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A248BE6ADF1
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 10:51:32 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.45217.1732359091428358538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 02:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id BFE288F3
	for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:51:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.244]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEnjb-18EtXt0; Sat, 23 Nov 2024 11:51:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Kirkstone][PATCH] gcc: add a backport patch to fix an issue with tzdata 2024b
Date: Sat, 23 Nov 2024 11:51:21 +0100
Message-ID: <20241123105121.3499-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732359087-167F2C42-709EF321/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e1adc92-4fc9-4444-8838-41b1f277593d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 10:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207676

There is an issue in the std::chrono::tzdb parser that causes problems
since the tzdata-2024b release started using %z in the main format.

As a real world problem I encounter an issue with the waybar clock module=
,
which ignores the timezone setting and only shows system time.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |   1 +
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ++++++++++++++++++
 2 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a=
710bea66ad651720d71c938b8.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.5.inc
index f17ec9da5c..5ef581c22c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -69,6 +69,7 @@ SRC_URI =3D "\
 	   file://0002-aarch64-add-armv9-a-to-march.patch \
 	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
+	   file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
=20
 SRC_URI[sha256sum] =3D "a6e21868ead545cf87f0c01f84276e4b5281d672098591c1=
c896241f09363478"
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea6=
6ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fff=
e3fc82a710bea66ad651720d71c938b8.patch
new file mode 100644
index 0000000000..e5abdcc703
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad6517=
20d71c938b8.patch
@@ -0,0 +1,549 @@
+From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Tue, 30 Apr 2024 09:52:13 +0100
+Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard =
format
+
+I found some issues in the std::chrono::tzdb parser by testing the
+tzdata "vanguard" format, which uses new features that aren't enabled in
+the "main" and "rearguard" data formats.
+
+Since 2024a the keyword "minimum" is no longer valid for the FROM and TO
+fields in a Rule line, which means that "m" is now a valid abbreviation
+for "maximum". Previously we expected either "mi" or "ma". For backwards
+compatibility, a FROM field beginning with "mi" is still supported and
+is treated as 1900. The "maximum" keyword is only allowed in TO now,
+because it makes no sense in FROM. To support these changes the
+minmax_year and minmax_year2 classes for parsing FROM and TO are
+replaced with a single years_from_to class that reads both fields.
+
+The vanguard format makes use of %z in Zone FORMAT fields, which caused
+an exception to be thrown from ZoneInfo::set_abbrev because no % or /
+characters were expected when a Zone doesn't use a named Rule. The
+ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replace
+any %z with the current offset. Although format_abbrev_str also checks
+for %s and STD/DST formats, those only make sense when a named Rule is
+in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
+
+Since making this change on trunk, the tzdata-2024b release started
+using %z in the main format, not just vanguard. This makes a backport to
+release branches necessary (see PR 116657).
+
+This change also implements a feature that has always been missing from
+time_zone::_M_get_sys_info: finding the Rule that is active before the
+specified time point, so that we can correctly handle %s in the FORMAT
+for the first new sys_info that gets created. This requires implementing
+a poorly documented feature of zic, to get the LETTERS field from a
+later transition, as described at
+https://mm.icann.org/pipermail/tz/2024-April/058891.html
+In order for this to work we need to be able to distinguish an empty
+letters field (as used by CE%sT where the variable part is either empty
+or "S") from "the letters field is not known for this transition". The
+tzdata file uses "-" for an empty letters field, which libstdc++ was
+previously replacing with "" when the Rule was parsed. Instead, we now
+preserve the "-" in the Rule object, so that "" can be used for the case
+where we don't know the letters (and so need to decide it).
+
+(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
+ .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
+ libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
+ 3 files changed, 274 insertions(+), 103 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_a=
bbrev.cc
+
+diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzd=
b.cc
+index c7c7cc9deee6..7e8cce7ce8cf 100644
+--- a/libstdc++-v3/src/c++20/tzdb.cc
++++ b/libstdc++-v3/src/c++20/tzdb.cc
+@@ -342,51 +342,103 @@ namespace std::chrono
+       friend istream& operator>>(istream&, on_day&);
+     };
+=20
+-    // Wrapper for chrono::year that reads a year, or one of the keywor=
ds
+-    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
+-    struct minmax_year
++    // Wrapper for two chrono::year values, which reads the FROM and TO
++    // fields of a Rule line. The FROM field is a year and TO is a year=
 or
++    // one of the keywords "maximum" or "only" (or an abbreviation of t=
hose).
++    // For backwards compatibility, the keyword "minimum" is recognized
++    // for FROM and interpreted as 1900.
++    struct years_from_to
+     {
+-      year& y;
++      year& from;
++      year& to;
+=20
+-      friend istream& operator>>(istream& in, minmax_year&& y)
++      friend istream& operator>>(istream& in, years_from_to&& yy)
+       {
+-	if (ws(in).peek() =3D=3D 'm') // keywords "minimum" or "maximum"
++	string s;
++	auto c =3D ws(in).peek();
++	if (c =3D=3D 'm') [[unlikely]] // keyword "minimum"
+ 	  {
+-	    string s;
+-	    in >> s; // extract the rest of the word, but only look at s[1]
+-	    if (s[1] =3D=3D 'a')
+-	      y.y =3D year::max();
+-	    else if (s[1] =3D=3D 'i')
+-	      y.y =3D year::min();
+-	    else
+-	      in.setstate(ios::failbit);
++	    in >> s; // extract the rest of the word
++	    yy.from =3D year(1900);
++	  }
++	else if (int num =3D 0; in >> num) [[likely]]
++	  yy.from =3D year{num};
++
++	c =3D ws(in).peek();
++	if (c =3D=3D 'm') // keyword "maximum"
++	  {
++	    in >> s; // extract the rest of the word
++	    yy.to =3D year::max();
++	  }
++	else if (c =3D=3D 'o') // keyword "only"
++	  {
++	    in >> s; // extract the rest of the word
++	    yy.to =3D yy.from;
+ 	  }
+ 	else if (int num =3D 0; in >> num)
+-	  y.y =3D year{num};
++	  yy.to =3D year{num};
++
+ 	return in;
+       }
+     };
+=20
+-    // As above for minmax_year, but also supports the keyword "only",
+-    // meaning that the TO year is the same as the FROM year.
+-    struct minmax_year2
++    bool
++    select_std_or_dst_abbrev(string& abbrev, minutes save)
+     {
+-      minmax_year to;
+-      year from;
++      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
++	{
++	  // Select one of "STD/DST" for standard or daylight.
++	  if (save =3D=3D 0min)
++	    abbrev.erase(pos);
++	  else
++	    abbrev.erase(0, pos + 1);
++	  return true;
++	}
++      return false;
++    }
+=20
+-      friend istream& operator>>(istream& in, minmax_year2&& y)
+-      {
+-	if (ws(in).peek() =3D=3D 'o') // keyword "only"
+-	  {
+-	    string s;
+-	    in >> s; // extract the whole keyword
+-	    y.to.y =3D y.from;
+-	  }
+-	else
+-	  in >> std::move(y.to);
+-	return in;
+-      }
+-    };
++    // Set the sys_info::abbrev string by expanding any placeholders.
++    void
++    format_abbrev_str(sys_info& info, string_view letters =3D {})
++    {
++      if (size_t pos =3D info.abbrev.find('%'); pos !=3D string::npos)
++	{
++	  if (info.abbrev[pos + 1] =3D=3D 's')
++	    {
++	      // Expand "%s" to the variable part, given by Rule::letters.
++	      if (letters =3D=3D "-")
++		info.abbrev.erase(pos, 2);
++	      else
++		info.abbrev.replace(pos, 2, letters);
++	    }
++	  else if (info.abbrev[pos + 1] =3D=3D 'z')
++	    {
++	      // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
++	      hh_mm_ss<seconds> t(info.offset);
++	      string z(1, "+-"[t.is_negative()]);
++	      long val =3D t.hours().count();
++	      int digits =3D 2;
++	      if (int m =3D t.minutes().count())
++		{
++		  digits =3D 4;
++		  val *=3D 100;
++		  val +=3D m;
++		  if (int s =3D t.seconds().count())
++		    {
++		      digits =3D 6;
++		      val *=3D 100;
++		      val +=3D s;
++		    }
++		}
++	      auto sval =3D std::to_string(val);
++	      z +=3D string(digits - sval.size(), '0');
++	      z +=3D sval;
++	      info.abbrev.replace(pos, 2, z);
++	    }
++	}
++      else
++	select_std_or_dst_abbrev(info.abbrev, info.save);
++    }
+=20
+     // A time zone information record.
+     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
+@@ -462,6 +514,7 @@ namespace std::chrono
+ 	info.offset =3D offset();
+ 	info.save =3D minutes(m_save);
+ 	info.abbrev =3D format();
++	format_abbrev_str(info); // expand %z
+ 	return true;
+       }
+=20
+@@ -469,12 +522,9 @@ namespace std::chrono
+       friend class time_zone;
+=20
+       void
+-      set_abbrev(const string& abbrev)
++      set_abbrev(string abbrev)
+       {
+-	// In practice, the FORMAT field never needs expanding here.
+-	if (abbrev.find_first_of("/%") !=3D abbrev.npos)
+-	  __throw_runtime_error("std::chrono::time_zone: invalid data");
+-	m_buf =3D abbrev;
++	m_buf =3D std::move(abbrev);
+ 	m_pos =3D 0;
+ 	m_expanded =3D true;
+       }
+@@ -544,9 +594,7 @@ namespace std::chrono
+=20
+ 	// Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
+=20
+-	in >> quoted(rule.name)
+-	   >> minmax_year{rule.from}
+-	   >> minmax_year2{rule.to, rule.from};
++	in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
+=20
+ 	if (char type; in >> type && type !=3D '-')
+ 	  in.setstate(ios::failbit);
+@@ -557,7 +605,7 @@ namespace std::chrono
+ 	if (save_time.indicator !=3D at_time::Wall)
+ 	  {
+ 	    // We don't actually store the save_time.indicator, because we
+-	    // assume that it's always deducable from the actual offset value.
++	    // assume that it's always deducible from the offset value.
+ 	    auto expected =3D save_time.time =3D=3D 0s
+ 			      ? at_time::Standard
+ 			      : at_time::Daylight;
+@@ -567,8 +615,6 @@ namespace std::chrono
+ 	rule.save =3D save_time.time;
+=20
+ 	in >> rule.letters;
+-	if (rule.letters =3D=3D "-")
+-	  rule.letters.clear();
+ 	return in;
+       }
+=20
+@@ -719,58 +765,6 @@ namespace std::chrono
+ #endif // TZDB_DISABLED
+   };
+=20
+-#ifndef TZDB_DISABLED
+-  namespace
+-  {
+-    bool
+-    select_std_or_dst_abbrev(string& abbrev, minutes save)
+-    {
+-      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
+-	{
+-	  // Select one of "STD/DST" for standard or daylight.
+-	  if (save =3D=3D 0min)
+-	    abbrev.erase(pos);
+-	  else
+-	    abbrev.erase(0, pos + 1);
+-	  return true;
+-	}
+-      return false;
+-    }
+-
+-    // Set the sys_info::abbrev string by expanding any placeholders.
+-    void
+-    format_abbrev_str(sys_info& info, string_view letters =3D {})
+-    {
+-      if (size_t pos =3D info.abbrev.find("%s"); pos !=3D string::npos)
+-	{
+-	  // Expand "%s" to the variable part, given by Rule::letters.
+-	  info.abbrev.replace(pos, 2, letters);
+-	}
+-      else if (size_t pos =3D info.abbrev.find("%z"); pos !=3D string::=
npos)
+-	{
+-	  // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
+-	  hh_mm_ss<seconds> t(info.offset);
+-	  string z(1, "+-"[t.is_negative()]);
+-	  long val =3D t.hours().count();
+-	  if (minutes m =3D t.minutes(); m !=3D m.zero())
+-	    {
+-	      val *=3D 100;
+-	      val +=3D m.count();
+-	      if (seconds s =3D t.seconds(); s !=3D s.zero())
+-		{
+-		  val *=3D 100;
+-		  val +=3D s.count();
+-		}
+-	    }
+-	  z +=3D std::to_string(val);
+-	  info.abbrev.replace(pos, 2, z);
+-	}
+-      else
+-	select_std_or_dst_abbrev(info.abbrev, info.save);
+-    }
+-  }
+-#endif // TZDB_DISABLED
+-
+   // Implementation of std::chrono::time_zone::get_info(const sys_time<=
D>&)
+   sys_info
+   time_zone::_M_get_sys_info(sys_seconds tp) const
+@@ -839,12 +833,72 @@ namespace std::chrono
+     info.abbrev =3D ri.format();
+=20
+     string_view letters;
+-    if (i !=3D infos.begin())
++    if (i !=3D infos.begin() && i[-1].expanded())
++      letters =3D i[-1].next_letters();
++
++    if (letters.empty())
+       {
+-	if (i[-1].expanded())
+-	  letters =3D i[-1].next_letters();
+-	// XXX else need to find Rule active before this time and use it
+-	// to know the initial offset, save, and letters.
++	sys_seconds t =3D info.begin - seconds(1);
++	const year_month_day date(chrono::floor<days>(t));
++
++	// Try to find a Rule active before this time, to get initial
++	// SAVE and LETTERS values. There may not be a Rule for the period
++	// before the first DST transition, so find the earliest DST->STD
++	// transition and use the LETTERS from that.
++	const Rule* active_rule =3D nullptr;
++	sys_seconds active_rule_start =3D sys_seconds::min();
++	const Rule* first_std =3D nullptr;
++	for (const auto& rule : rules)
++	  {
++	    if (rule.save =3D=3D minutes(0))
++	      {
++		if (!first_std)
++		  first_std =3D &rule;
++		else if (rule.from < first_std->from)
++		  first_std =3D &rule;
++		else if (rule.from =3D=3D first_std->from)
++		  {
++		    if (rule.start_time(rule.from, {})
++			  < first_std->start_time(first_std->from, {}))
++		      first_std =3D &rule;
++		  }
++	      }
++
++	    year y =3D date.year();
++
++	    if (y > rule.to) // rule no longer applies at time t
++	      continue;
++	    if (y < rule.from) // rule doesn't apply yet at time t
++	      continue;
++
++	    sys_seconds rule_start;
++
++	    seconds offset{}; // appropriate for at_time::Universal
++	    if (rule.when.indicator =3D=3D at_time::Wall)
++	      offset =3D info.offset;
++	    else if (rule.when.indicator =3D=3D at_time::Standard)
++	      offset =3D ri.offset();
++
++	    // Time the rule takes effect this year:
++	    rule_start =3D rule.start_time(y, offset);
++
++	    if (rule_start >=3D t && rule.from < y)
++	      {
++		// Try this rule in the previous year.
++		rule_start =3D rule.start_time(--y, offset);
++	      }
++
++	    if (active_rule_start < rule_start && rule_start < t)
++	      {
++		active_rule_start =3D rule_start;
++		active_rule =3D &rule;
++	      }
++	  }
++
++	if (active_rule)
++	  letters =3D active_rule->letters;
++	else if (first_std)
++	  letters =3D first_std->letters;
+       }
+=20
+     const Rule* curr_rule =3D nullptr;
+@@ -2069,9 +2123,11 @@ namespace std::chrono
+ 	      istringstream in2(std::move(rules));
+ 	      in2 >> rules_time;
+ 	      inf.m_save =3D duration_cast<minutes>(rules_time.time);
++	      // If the FORMAT is "STD/DST" then we can choose the right one
++	      // now, so that we store a shorter string.
+ 	      select_std_or_dst_abbrev(fmt, inf.m_save);
+ 	    }
+-	  inf.set_abbrev(fmt);
++	  inf.set_abbrev(std::move(fmt));
+ 	}
+=20
+       // YEAR [MONTH [DAY [TIME]]]
+@@ -2082,7 +2138,12 @@ namespace std::chrono
+ 	  abbrev_month m{January};
+ 	  int d =3D 1;
+ 	  at_time t{};
++	  // XXX DAY should support ON format, e.g. lastSun or Sun>=3D8
+ 	  in >> m >> d >> t;
++	  // XXX UNTIL field should be interpreted
++	  // "using the rules in effect just before the transition"
++	  // so might need to store as year_month_day and hh_mm_ss and only
++	  // convert to a sys_time once we know the offset in effect.
+ 	  inf.m_until =3D sys_days(year(y)/m.m/day(d)) + seconds(t.time);
+ 	}
+       else
+diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.c=
c b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
+new file mode 100644
+index 000000000000..f1a8fff02f58
+--- /dev/null
++++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
+@@ -0,0 +1,106 @@
++// { dg-do run { target c++20 } }
++// { dg-require-effective-target tzdb }
++// { dg-require-effective-target cxx11_abi }
++// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } }
++
++#include <chrono>
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static bool override_used =3D false;
++
++namespace __gnu_cxx
++{
++  const char* zoneinfo_dir_override() {
++    override_used =3D true;
++    return "./";
++  }
++}
++
++using namespace std::chrono;
++
++void
++test_format()
++{
++  std::ofstream("tzdata.zi") << R"(# version test_1
++Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
++                   -1      - %z  1975
++                   0       - GMT
++Zon Some/Zone 1:2:3   - %z 1900
++              1:23:45 - %z 1950
++Zo Another/Zone 1:2:3 -     AZ0     1901
++                1     Roolz A%sZ    2000
++                1     Roolz SAZ/DAZ 2005
++                1     Roolz %z
++Rule Roolz 1950 max - April 1 2 1 D
++Rul  Roolz 1950 max - Oct   1 1 0 S
++Z Strange/Zone 1       - X%sX    1980
++               1       - FOO/BAR 1990
++               2:00    - %zzz    1995
++               0:9     - %zzz    1996
++               0:8:7   - %zzz    1997
++               0:6:5.5 - %zzz    1998
++)";
++
++  const auto& db =3D reload_tzdb();
++  VERIFY( override_used ); // If this fails then XFAIL for the target.
++  VERIFY( db.version =3D=3D "test_1" );
++
++  // Test formatting %z as
++  auto tz =3D locate_zone("Africa/Bissau");
++  auto inf =3D tz->get_info(sys_days(1974y/1/1));
++  VERIFY( inf.abbrev =3D=3D "-01" );
++
++  tz =3D locate_zone("Some/Zone");
++  inf =3D tz->get_info(sys_days(1899y/1/1));
++  VERIFY( inf.abbrev =3D=3D "+010203" );
++  inf =3D tz->get_info(sys_days(1955y/1/1));
++  VERIFY( inf.abbrev =3D=3D "+012345" );
++
++  tz =3D locate_zone("Another/Zone");
++  // Test formatting %s as the LETTER/S field from the active Rule.
++  inf =3D tz->get_info(sys_days(1910y/January/1));
++  VERIFY( inf.abbrev =3D=3D "ASZ" );
++  inf =3D tz->get_info(sys_days(1950y/January/1));
++  VERIFY( inf.abbrev =3D=3D "ASZ" );
++  inf =3D tz->get_info(sys_days(1950y/June/1));
++  VERIFY( inf.abbrev =3D=3D "ADZ" );
++  inf =3D tz->get_info(sys_days(1999y/January/1));
++  VERIFY( inf.abbrev =3D=3D "ASZ" );
++  inf =3D tz->get_info(sys_days(1999y/July/1));
++  VERIFY( inf.abbrev =3D=3D "ADZ" );
++  // Test formatting STD/DST according to the active Rule.
++  inf =3D tz->get_info(sys_days(2000y/January/2));
++  VERIFY( inf.abbrev =3D=3D "SAZ" );
++  inf =3D tz->get_info(sys_days(2001y/January/1));
++  VERIFY( inf.abbrev =3D=3D "SAZ" );
++  inf =3D tz->get_info(sys_days(2001y/July/1));
++  VERIFY( inf.abbrev =3D=3D "DAZ" );
++  // Test formatting %z as the offset determined by the active Rule.
++  inf =3D tz->get_info(sys_days(2005y/January/2));
++  VERIFY( inf.abbrev =3D=3D "+01" );
++  inf =3D tz->get_info(sys_days(2006y/January/1));
++  VERIFY( inf.abbrev =3D=3D "+01" );
++  inf =3D tz->get_info(sys_days(2006y/July/1));
++  VERIFY( inf.abbrev =3D=3D "+02" );
++
++  // Test formatting %z, %s and S/D for a Zone with no associated Rules=
.
++  tz =3D locate_zone("Strange/Zone");
++  inf =3D tz->get_info(sys_days(1979y/January/1));
++  VERIFY( inf.abbrev =3D=3D "XX" ); // No Rule means nothing to use for=
 %s.
++  inf =3D tz->get_info(sys_days(1981y/July/1));
++  VERIFY( inf.abbrev =3D=3D "FOO" ); // Always standard time means firs=
t string.
++  inf =3D tz->get_info(sys_days(1994y/July/1));
++  VERIFY( inf.abbrev =3D=3D "+02zz" );
++  inf =3D tz->get_info(sys_days(1995y/July/1));
++  VERIFY( inf.abbrev =3D=3D "+0009zz" );
++  inf =3D tz->get_info(sys_days(1996y/July/1));
++  VERIFY( inf.abbrev =3D=3D "+000807zz" );
++  inf =3D tz->get_info(sys_days(1997y/July/1));
++  VERIFY( inf.abbrev =3D=3D "+000606zz" );
++}
++
++int main()
++{
++  test_format();
++}
+diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/te=
stsuite/std/time/tzdb/1.cc
+index 796f3a8b4256..7a31c1c20ba7 100644
+--- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
++++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
+@@ -39,11 +39,15 @@ test_locate()
+   const tzdb& db =3D get_tzdb();
+   const time_zone* tz =3D db.locate_zone("GMT");
+   VERIFY( tz !=3D nullptr );
+-  VERIFY( tz->name() =3D=3D "Etc/GMT" );
+   VERIFY( tz =3D=3D std::chrono::locate_zone("GMT") );
+   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT") );
+   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT+0") );
+=20
++  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice v=
ersa,
++  // but only when using the vanguard format. As of 2024a, the main and
++  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
++  VERIFY( tz->name() =3D=3D "GMT" || tz->name() =3D=3D "Etc/GMT" );
++
+   VERIFY( db.locate_zone(db.current_zone()->name()) =3D=3D db.current_z=
one() );
+ }
+=20
+--=20
+2.43.5
+
--=20
2.47.0


