Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F15BD5A6DA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:27 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.64676.1732680737600218897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eChMxnW7;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ea5a7a5e48so815905b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680737; x=1733285537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMpUc/7W4lnpBdDrByKnhx8eqgmwGDX++OhKioT2ahM=;
        b=eChMxnW7KUT7aPkm2OVxEDlgxo6lI+TsTLhHYhenebq/C7dl6FvoOM9JNxt2qJ5sX0
         1G9/5gfjJpOMvgqOCYCR5kaOhCr2mmbQBWKQyFEh5vfHS8Qa2x9HUkIClYUZcM4YglCZ
         uCfh/E5wyS4BOLAXSuaIGHJ26jw5XpOKyfLxG7zWTKUepWRnFp3ov3WXC8gZBAMjGAVh
         Zra7HTCZPtmCo0s1rVq+uOtAoB12xk72UETyYNWoE6OGP5M9+UXmoIjBptM83+ErGiXH
         O1Z1e/nk5JYf2D9Gysg4/icQlRYZA23dhfrPpyZxlbzQuqrHdqx0ixFk8uHWB47bszjA
         IXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680737; x=1733285537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMpUc/7W4lnpBdDrByKnhx8eqgmwGDX++OhKioT2ahM=;
        b=mfBz4MHT/fXDCZgIyTtPwYiMJwf3LqaIwPQxP4p2qUhdFvZ6JGDeZU8uP0W16xGhXv
         M8R5egW46TJmYF31lfp5tbcNrZiq1ViemOH4LaeTuIzZFtQnSPlLIFIQDsr+eCYK3RBD
         MhznWUcbtgLg5xNscUeR93PMvKEJ/+fet5DzfsCKYIdiMWYvnQIgSV5dv3AFtN/rB4hz
         VsUeY9+fO+bwKjEasGznyz6cd28EHW3zML0WHk8oNTbjnIcXtHLrlrKlstu3m5xAqux3
         Mg+snaAu2vkCT/ByQgzBq2y23p+1EwMeAF1RY6E+wOk5xnsZday1QmCz1maOIttqIoqk
         okHQ==
X-Gm-Message-State: AOJu0YynoTOmoW4VBSj2Sk81sGw2PtYH106ZHowcK/xlaQJ0Q9HALGKk
	ZSAFLkEEOsbB5oa6jn7fHLpvFtjKMO6ft0xvCGTLpjbQe+Zu00S72VufMR6KUnIR+paIDB+XISh
	1
X-Gm-Gg: ASbGncsSdqKe+2e1W+a3FRlf83tNsX/CtothB0eomhNY10AE04xt/6FbxlMPvDtpQQL
	3qib1oadCAIjopkT/fY0e4RWW4St8YaBrg4sECJuHZ6AxuUBEjxZ+J6dDljhjSPi1uUIazY2eXC
	hbZwoEeVvj0nfYdSwEn2EpMWhVSHlCrdNKaW1j7BSpEn1IfNUuAKe9lLlZ1ARiqZwvEpS2rHTvU
	+GkJT9S/hoc9He9ZPIgizJg1I3gXxHszksXBXw=
X-Google-Smtp-Source: AGHT+IEDPFeNyH5gMw646HBvaUprTsQ5umDFw6BWJgfXlKy6CVoSFH45nLVSnK1DwwEWNOzOo0CkhA==
X-Received: by 2002:a05:6808:2219:b0:3e6:60dc:5aee with SMTP id 5614622812f47-3ea6db8721cmr1530730b6e.3.1732680736227;
        Tue, 26 Nov 2024 20:12:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 16/18] gcc: add a backport patch to fix an issue with tzdata 2024b
Date: Tue, 26 Nov 2024 20:11:36 -0800
Message-Id: <08dfd3849bd804f4760ebeca226645e65709a65a.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207910

From: Markus Volk <f_l_k@t-online.de>

There is an issue in the std::chrono::tzdb parser that causes problems
since the tzdata-2024b release started using %z in the main format.

As a real world problem I encounter an issue with the waybar clock module,
which ignores the timezone setting and only shows system time.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39018429f05511053ab12e23e7f4487ea25ee529)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ++++++++++++++++++
 2 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index f05484cfc0..9cfb246294 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
new file mode 100644
index 0000000000..e5abdcc703
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
@@ -0,0 +1,549 @@
+From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Tue, 30 Apr 2024 09:52:13 +0100
+Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard format
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
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
+ .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
+ libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
+ 3 files changed, 274 insertions(+), 103 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
+
+diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzdb.cc
+index c7c7cc9deee6..7e8cce7ce8cf 100644
+--- a/libstdc++-v3/src/c++20/tzdb.cc
++++ b/libstdc++-v3/src/c++20/tzdb.cc
+@@ -342,51 +342,103 @@ namespace std::chrono
+       friend istream& operator>>(istream&, on_day&);
+     };
+ 
+-    // Wrapper for chrono::year that reads a year, or one of the keywords
+-    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
+-    struct minmax_year
++    // Wrapper for two chrono::year values, which reads the FROM and TO
++    // fields of a Rule line. The FROM field is a year and TO is a year or
++    // one of the keywords "maximum" or "only" (or an abbreviation of those).
++    // For backwards compatibility, the keyword "minimum" is recognized
++    // for FROM and interpreted as 1900.
++    struct years_from_to
+     {
+-      year& y;
++      year& from;
++      year& to;
+ 
+-      friend istream& operator>>(istream& in, minmax_year&& y)
++      friend istream& operator>>(istream& in, years_from_to&& yy)
+       {
+-	if (ws(in).peek() == 'm') // keywords "minimum" or "maximum"
++	string s;
++	auto c = ws(in).peek();
++	if (c == 'm') [[unlikely]] // keyword "minimum"
+ 	  {
+-	    string s;
+-	    in >> s; // extract the rest of the word, but only look at s[1]
+-	    if (s[1] == 'a')
+-	      y.y = year::max();
+-	    else if (s[1] == 'i')
+-	      y.y = year::min();
+-	    else
+-	      in.setstate(ios::failbit);
++	    in >> s; // extract the rest of the word
++	    yy.from = year(1900);
++	  }
++	else if (int num = 0; in >> num) [[likely]]
++	  yy.from = year{num};
++
++	c = ws(in).peek();
++	if (c == 'm') // keyword "maximum"
++	  {
++	    in >> s; // extract the rest of the word
++	    yy.to = year::max();
++	  }
++	else if (c == 'o') // keyword "only"
++	  {
++	    in >> s; // extract the rest of the word
++	    yy.to = yy.from;
+ 	  }
+ 	else if (int num = 0; in >> num)
+-	  y.y = year{num};
++	  yy.to = year{num};
++
+ 	return in;
+       }
+     };
+ 
+-    // As above for minmax_year, but also supports the keyword "only",
+-    // meaning that the TO year is the same as the FROM year.
+-    struct minmax_year2
++    bool
++    select_std_or_dst_abbrev(string& abbrev, minutes save)
+     {
+-      minmax_year to;
+-      year from;
++      if (size_t pos = abbrev.find('/'); pos != string::npos)
++	{
++	  // Select one of "STD/DST" for standard or daylight.
++	  if (save == 0min)
++	    abbrev.erase(pos);
++	  else
++	    abbrev.erase(0, pos + 1);
++	  return true;
++	}
++      return false;
++    }
+ 
+-      friend istream& operator>>(istream& in, minmax_year2&& y)
+-      {
+-	if (ws(in).peek() == 'o') // keyword "only"
+-	  {
+-	    string s;
+-	    in >> s; // extract the whole keyword
+-	    y.to.y = y.from;
+-	  }
+-	else
+-	  in >> std::move(y.to);
+-	return in;
+-      }
+-    };
++    // Set the sys_info::abbrev string by expanding any placeholders.
++    void
++    format_abbrev_str(sys_info& info, string_view letters = {})
++    {
++      if (size_t pos = info.abbrev.find('%'); pos != string::npos)
++	{
++	  if (info.abbrev[pos + 1] == 's')
++	    {
++	      // Expand "%s" to the variable part, given by Rule::letters.
++	      if (letters == "-")
++		info.abbrev.erase(pos, 2);
++	      else
++		info.abbrev.replace(pos, 2, letters);
++	    }
++	  else if (info.abbrev[pos + 1] == 'z')
++	    {
++	      // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
++	      hh_mm_ss<seconds> t(info.offset);
++	      string z(1, "+-"[t.is_negative()]);
++	      long val = t.hours().count();
++	      int digits = 2;
++	      if (int m = t.minutes().count())
++		{
++		  digits = 4;
++		  val *= 100;
++		  val += m;
++		  if (int s = t.seconds().count())
++		    {
++		      digits = 6;
++		      val *= 100;
++		      val += s;
++		    }
++		}
++	      auto sval = std::to_string(val);
++	      z += string(digits - sval.size(), '0');
++	      z += sval;
++	      info.abbrev.replace(pos, 2, z);
++	    }
++	}
++      else
++	select_std_or_dst_abbrev(info.abbrev, info.save);
++    }
+ 
+     // A time zone information record.
+     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
+@@ -462,6 +514,7 @@ namespace std::chrono
+ 	info.offset = offset();
+ 	info.save = minutes(m_save);
+ 	info.abbrev = format();
++	format_abbrev_str(info); // expand %z
+ 	return true;
+       }
+ 
+@@ -469,12 +522,9 @@ namespace std::chrono
+       friend class time_zone;
+ 
+       void
+-      set_abbrev(const string& abbrev)
++      set_abbrev(string abbrev)
+       {
+-	// In practice, the FORMAT field never needs expanding here.
+-	if (abbrev.find_first_of("/%") != abbrev.npos)
+-	  __throw_runtime_error("std::chrono::time_zone: invalid data");
+-	m_buf = abbrev;
++	m_buf = std::move(abbrev);
+ 	m_pos = 0;
+ 	m_expanded = true;
+       }
+@@ -544,9 +594,7 @@ namespace std::chrono
+ 
+ 	// Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
+ 
+-	in >> quoted(rule.name)
+-	   >> minmax_year{rule.from}
+-	   >> minmax_year2{rule.to, rule.from};
++	in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
+ 
+ 	if (char type; in >> type && type != '-')
+ 	  in.setstate(ios::failbit);
+@@ -557,7 +605,7 @@ namespace std::chrono
+ 	if (save_time.indicator != at_time::Wall)
+ 	  {
+ 	    // We don't actually store the save_time.indicator, because we
+-	    // assume that it's always deducable from the actual offset value.
++	    // assume that it's always deducible from the offset value.
+ 	    auto expected = save_time.time == 0s
+ 			      ? at_time::Standard
+ 			      : at_time::Daylight;
+@@ -567,8 +615,6 @@ namespace std::chrono
+ 	rule.save = save_time.time;
+ 
+ 	in >> rule.letters;
+-	if (rule.letters == "-")
+-	  rule.letters.clear();
+ 	return in;
+       }
+ 
+@@ -719,58 +765,6 @@ namespace std::chrono
+ #endif // TZDB_DISABLED
+   };
+ 
+-#ifndef TZDB_DISABLED
+-  namespace
+-  {
+-    bool
+-    select_std_or_dst_abbrev(string& abbrev, minutes save)
+-    {
+-      if (size_t pos = abbrev.find('/'); pos != string::npos)
+-	{
+-	  // Select one of "STD/DST" for standard or daylight.
+-	  if (save == 0min)
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
+-    format_abbrev_str(sys_info& info, string_view letters = {})
+-    {
+-      if (size_t pos = info.abbrev.find("%s"); pos != string::npos)
+-	{
+-	  // Expand "%s" to the variable part, given by Rule::letters.
+-	  info.abbrev.replace(pos, 2, letters);
+-	}
+-      else if (size_t pos = info.abbrev.find("%z"); pos != string::npos)
+-	{
+-	  // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
+-	  hh_mm_ss<seconds> t(info.offset);
+-	  string z(1, "+-"[t.is_negative()]);
+-	  long val = t.hours().count();
+-	  if (minutes m = t.minutes(); m != m.zero())
+-	    {
+-	      val *= 100;
+-	      val += m.count();
+-	      if (seconds s = t.seconds(); s != s.zero())
+-		{
+-		  val *= 100;
+-		  val += s.count();
+-		}
+-	    }
+-	  z += std::to_string(val);
+-	  info.abbrev.replace(pos, 2, z);
+-	}
+-      else
+-	select_std_or_dst_abbrev(info.abbrev, info.save);
+-    }
+-  }
+-#endif // TZDB_DISABLED
+-
+   // Implementation of std::chrono::time_zone::get_info(const sys_time<D>&)
+   sys_info
+   time_zone::_M_get_sys_info(sys_seconds tp) const
+@@ -839,12 +833,72 @@ namespace std::chrono
+     info.abbrev = ri.format();
+ 
+     string_view letters;
+-    if (i != infos.begin())
++    if (i != infos.begin() && i[-1].expanded())
++      letters = i[-1].next_letters();
++
++    if (letters.empty())
+       {
+-	if (i[-1].expanded())
+-	  letters = i[-1].next_letters();
+-	// XXX else need to find Rule active before this time and use it
+-	// to know the initial offset, save, and letters.
++	sys_seconds t = info.begin - seconds(1);
++	const year_month_day date(chrono::floor<days>(t));
++
++	// Try to find a Rule active before this time, to get initial
++	// SAVE and LETTERS values. There may not be a Rule for the period
++	// before the first DST transition, so find the earliest DST->STD
++	// transition and use the LETTERS from that.
++	const Rule* active_rule = nullptr;
++	sys_seconds active_rule_start = sys_seconds::min();
++	const Rule* first_std = nullptr;
++	for (const auto& rule : rules)
++	  {
++	    if (rule.save == minutes(0))
++	      {
++		if (!first_std)
++		  first_std = &rule;
++		else if (rule.from < first_std->from)
++		  first_std = &rule;
++		else if (rule.from == first_std->from)
++		  {
++		    if (rule.start_time(rule.from, {})
++			  < first_std->start_time(first_std->from, {}))
++		      first_std = &rule;
++		  }
++	      }
++
++	    year y = date.year();
++
++	    if (y > rule.to) // rule no longer applies at time t
++	      continue;
++	    if (y < rule.from) // rule doesn't apply yet at time t
++	      continue;
++
++	    sys_seconds rule_start;
++
++	    seconds offset{}; // appropriate for at_time::Universal
++	    if (rule.when.indicator == at_time::Wall)
++	      offset = info.offset;
++	    else if (rule.when.indicator == at_time::Standard)
++	      offset = ri.offset();
++
++	    // Time the rule takes effect this year:
++	    rule_start = rule.start_time(y, offset);
++
++	    if (rule_start >= t && rule.from < y)
++	      {
++		// Try this rule in the previous year.
++		rule_start = rule.start_time(--y, offset);
++	      }
++
++	    if (active_rule_start < rule_start && rule_start < t)
++	      {
++		active_rule_start = rule_start;
++		active_rule = &rule;
++	      }
++	  }
++
++	if (active_rule)
++	  letters = active_rule->letters;
++	else if (first_std)
++	  letters = first_std->letters;
+       }
+ 
+     const Rule* curr_rule = nullptr;
+@@ -2069,9 +2123,11 @@ namespace std::chrono
+ 	      istringstream in2(std::move(rules));
+ 	      in2 >> rules_time;
+ 	      inf.m_save = duration_cast<minutes>(rules_time.time);
++	      // If the FORMAT is "STD/DST" then we can choose the right one
++	      // now, so that we store a shorter string.
+ 	      select_std_or_dst_abbrev(fmt, inf.m_save);
+ 	    }
+-	  inf.set_abbrev(fmt);
++	  inf.set_abbrev(std::move(fmt));
+ 	}
+ 
+       // YEAR [MONTH [DAY [TIME]]]
+@@ -2082,7 +2138,12 @@ namespace std::chrono
+ 	  abbrev_month m{January};
+ 	  int d = 1;
+ 	  at_time t{};
++	  // XXX DAY should support ON format, e.g. lastSun or Sun>=8
+ 	  in >> m >> d >> t;
++	  // XXX UNTIL field should be interpreted
++	  // "using the rules in effect just before the transition"
++	  // so might need to store as year_month_day and hh_mm_ss and only
++	  // convert to a sys_time once we know the offset in effect.
+ 	  inf.m_until = sys_days(year(y)/m.m/day(d)) + seconds(t.time);
+ 	}
+       else
+diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
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
++static bool override_used = false;
++
++namespace __gnu_cxx
++{
++  const char* zoneinfo_dir_override() {
++    override_used = true;
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
++  const auto& db = reload_tzdb();
++  VERIFY( override_used ); // If this fails then XFAIL for the target.
++  VERIFY( db.version == "test_1" );
++
++  // Test formatting %z as
++  auto tz = locate_zone("Africa/Bissau");
++  auto inf = tz->get_info(sys_days(1974y/1/1));
++  VERIFY( inf.abbrev == "-01" );
++
++  tz = locate_zone("Some/Zone");
++  inf = tz->get_info(sys_days(1899y/1/1));
++  VERIFY( inf.abbrev == "+010203" );
++  inf = tz->get_info(sys_days(1955y/1/1));
++  VERIFY( inf.abbrev == "+012345" );
++
++  tz = locate_zone("Another/Zone");
++  // Test formatting %s as the LETTER/S field from the active Rule.
++  inf = tz->get_info(sys_days(1910y/January/1));
++  VERIFY( inf.abbrev == "ASZ" );
++  inf = tz->get_info(sys_days(1950y/January/1));
++  VERIFY( inf.abbrev == "ASZ" );
++  inf = tz->get_info(sys_days(1950y/June/1));
++  VERIFY( inf.abbrev == "ADZ" );
++  inf = tz->get_info(sys_days(1999y/January/1));
++  VERIFY( inf.abbrev == "ASZ" );
++  inf = tz->get_info(sys_days(1999y/July/1));
++  VERIFY( inf.abbrev == "ADZ" );
++  // Test formatting STD/DST according to the active Rule.
++  inf = tz->get_info(sys_days(2000y/January/2));
++  VERIFY( inf.abbrev == "SAZ" );
++  inf = tz->get_info(sys_days(2001y/January/1));
++  VERIFY( inf.abbrev == "SAZ" );
++  inf = tz->get_info(sys_days(2001y/July/1));
++  VERIFY( inf.abbrev == "DAZ" );
++  // Test formatting %z as the offset determined by the active Rule.
++  inf = tz->get_info(sys_days(2005y/January/2));
++  VERIFY( inf.abbrev == "+01" );
++  inf = tz->get_info(sys_days(2006y/January/1));
++  VERIFY( inf.abbrev == "+01" );
++  inf = tz->get_info(sys_days(2006y/July/1));
++  VERIFY( inf.abbrev == "+02" );
++
++  // Test formatting %z, %s and S/D for a Zone with no associated Rules.
++  tz = locate_zone("Strange/Zone");
++  inf = tz->get_info(sys_days(1979y/January/1));
++  VERIFY( inf.abbrev == "XX" ); // No Rule means nothing to use for %s.
++  inf = tz->get_info(sys_days(1981y/July/1));
++  VERIFY( inf.abbrev == "FOO" ); // Always standard time means first string.
++  inf = tz->get_info(sys_days(1994y/July/1));
++  VERIFY( inf.abbrev == "+02zz" );
++  inf = tz->get_info(sys_days(1995y/July/1));
++  VERIFY( inf.abbrev == "+0009zz" );
++  inf = tz->get_info(sys_days(1996y/July/1));
++  VERIFY( inf.abbrev == "+000807zz" );
++  inf = tz->get_info(sys_days(1997y/July/1));
++  VERIFY( inf.abbrev == "+000606zz" );
++}
++
++int main()
++{
++  test_format();
++}
+diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
+index 796f3a8b4256..7a31c1c20ba7 100644
+--- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
++++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
+@@ -39,11 +39,15 @@ test_locate()
+   const tzdb& db = get_tzdb();
+   const time_zone* tz = db.locate_zone("GMT");
+   VERIFY( tz != nullptr );
+-  VERIFY( tz->name() == "Etc/GMT" );
+   VERIFY( tz == std::chrono::locate_zone("GMT") );
+   VERIFY( tz == db.locate_zone("Etc/GMT") );
+   VERIFY( tz == db.locate_zone("Etc/GMT+0") );
+ 
++  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice versa,
++  // but only when using the vanguard format. As of 2024a, the main and
++  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
++  VERIFY( tz->name() == "GMT" || tz->name() == "Etc/GMT" );
++
+   VERIFY( db.locate_zone(db.current_zone()->name()) == db.current_zone() );
+ }
+ 
+-- 
+2.43.5
+
-- 
2.34.1


