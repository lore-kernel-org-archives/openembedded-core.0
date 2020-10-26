Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1186.1603735270487467052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 11:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2040A139F
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 11:01:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42FC3F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 11:01:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: fix parsing of slim encoded tzdata
Date: Mon, 26 Oct 2020 18:01:06 +0000
Message-Id: <20201026180106.469886-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As of tzcode 2020b the timezone data is encoded using the 'slim' format
instead of the previous 'fat'.  This exposes a number of bugs in GLib,
so backport the fixes to improve the parser.

[ YOCTO #14106 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-2.0/glib-2.0/tzdata-update.patch     | 458 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |   1 +
 2 files changed, 459 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/tzdata-update.pat=
ch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/tzdata-update.patch b/me=
ta/recipes-core/glib-2.0/glib-2.0/tzdata-update.patch
new file mode 100644
index 0000000000..0af036f8bd
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/tzdata-update.patch
@@ -0,0 +1,458 @@
+Backport a number of patches from upstream to fix reading of the new 'sl=
im'
+encoding for tzdata files.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+commit 18cbd5e5a4812e9bd0b06a058322d2b44ed2ad92
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    Clarify memset in set_tz_name
+
+    * glib/gtimezone.c (set_tz_name): Use size, not NAME_SIZE,
+    to clear the buffer.  Suggested by Philip Withnall in:
+    https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1533#note_86785=
9
+
+commit 1ab3f927d6d09a8cf3349a3545f5351446f43d47
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    gtimezone: support footers in TZif files
+
+    Since tzcode95f (1995), TZif files have had a trailing
+    TZ string, used for timestamps after the last transition.
+    This string is specified in Internet RFC 8536 section 3.3.
+    init_zone_from_iana_info has ignored this string, causing it
+    to mishandle timestamps past the year 2038.  With zic's new -b
+    slim flag, init_zone_from_iana_info would even mishandle current
+    timestamps.  Fix this by parsing the trailing TZ string and adding
+    its transitions.
+
+    Closes #2129
+
+commit e8b763e35235a2c6b4bdd48a5099c00f72741059
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    gtimezone: add support for RFC 8536 time zone transitions
+
+    Time zone transition times can range from -167:59:59 through
+    +167:59:59, according to Internet RFC 8536 section 3.3.1;
+    this is an extension to POSIX.  It is needed for proper
+    support of TZif version 3 files.
+
+commit 1c65dd48b8ebd31af8bc9b2263f83c0c411f7519
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    gtimezone: allow hh to be 24, as per POSIX
+
+    POSIX allows hh to be 24; see
+    https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.=
html#tag_08_03
+
+commit 368b65cb4cb17e29a4f55654149f554a14f48bc6
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    gtimezone: support POSIX 1003.1-2001 quoted TZ abbreviations
+
+    TZ strings like '<-03>3' were introduced in POSIX 1003.1-2001 and
+    are currently specified in:
+    https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.=
html#tag_08_03
+
+commit fd528aaab6bb077c6d217e62f2228ec9fe3ed760
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Thu Jul 16 12:41:49 2020 -0700
+
+    gtimezone: get 64-bit data from version-3 TZif files
+
+    Version 3 was introduced in tzdb 2013e (2013).
+    See Internet RFC 8536 section 3.1 under "ver(sion)".
+
+diff --git a/glib/gtimezone.c b/glib/gtimezone.c
+index 5a835dea9..f9eee1967 100644
+--- a/glib/gtimezone.c
++++ b/glib/gtimezone.c
+@@ -142,9 +142,7 @@ typedef struct
+   gint     mday;
+   gint     wday;
+   gint     week;
+-  gint     hour;
+-  gint     min;
+-  gint     sec;
++  gint32   offset;  /* hour*3600 + min*60 + sec; can be negative.  */
+ } TimeZoneDate;
+=20
+ /* POSIX Timezone abbreviations are typically 3 or 4 characters, but
+@@ -205,6 +203,10 @@ static GTimeZone *tz_local =3D NULL;
+                            there's no point in getting carried
+                            away. */
+=20
++#ifdef G_OS_UNIX
++static GTimeZone *parse_footertz (const gchar *, size_t);
++#endif
++
+ /**
+  * g_time_zone_unref:
+  * @tz: a #GTimeZone
+@@ -286,13 +288,20 @@ g_time_zone_ref (GTimeZone *tz)
+ /* fake zoneinfo creation (for RFC3339/ISO 8601 timezones) {{{1 */
+ /*
+  * parses strings of the form h or hh[[:]mm[[[:]ss]]] where:
+- *  - h[h] is 0 to 23
++ *  - h[h] is 0 to 24
+  *  - mm is 00 to 59
+  *  - ss is 00 to 59
++ * If RFC8536, TIME_ is a transition time sans sign,
++ * so colons are required before mm and ss, and hh can be up to 167.
++ * See Internet RFC 8536 section 3.3.1:
++ * https://tools.ietf.org/html/rfc8536#section-3.3.1
++ * and POSIX Base Definitions 8.3 TZ rule time:
++ * https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.=
html#tag_08_03
+  */
+ static gboolean
+ parse_time (const gchar *time_,
+-            gint32      *offset)
++            gint32      *offset,
++            gboolean    rfc8536)
+ {
+   if (*time_ < '0' || '9' < *time_)
+     return FALSE;
+@@ -310,7 +319,20 @@ parse_time (const gchar *time_,
+       *offset *=3D 10;
+       *offset +=3D 60 * 60 * (*time_++ - '0');
+=20
+-      if (*offset > 23 * 60 * 60)
++      if (rfc8536)
++        {
++          /* Internet RFC 8536 section 3.3.1 and POSIX 8.3 TZ together =
say
++             that a transition time must be of the form [+-]hh[:mm[:ss]=
] where
++             the hours part can range from -167 to 167.  */
++          if ('0' <=3D *time_ && *time_ <=3D '9')
++            {
++              *offset *=3D 10;
++              *offset +=3D 60 * 60 * (*time_++ - '0');
++            }
++          if (*offset > 167 * 60 * 60)
++            return FALSE;
++        }
++      else if (*offset > 24 * 60 * 60)
+         return FALSE;
+=20
+       if (*time_ =3D=3D '\0')
+@@ -319,6 +341,8 @@ parse_time (const gchar *time_,
+=20
+   if (*time_ =3D=3D ':')
+     time_++;
++  else if (rfc8536)
++    return FALSE;
+=20
+   if (*time_ < '0' || '5' < *time_)
+     return FALSE;
+@@ -335,6 +359,8 @@ parse_time (const gchar *time_,
+=20
+   if (*time_ =3D=3D ':')
+     time_++;
++  else if (rfc8536)
++    return FALSE;
+=20
+   if (*time_ < '0' || '5' < *time_)
+     return FALSE;
+@@ -351,28 +377,32 @@ parse_time (const gchar *time_,
+=20
+ static gboolean
+ parse_constant_offset (const gchar *name,
+-                       gint32      *offset)
++                       gint32      *offset,
++                       gboolean    rfc8536)
+ {
+-  if (g_strcmp0 (name, "UTC") =3D=3D 0)
++  /* Internet RFC 8536 section 3.3.1 and POSIX 8.3 TZ together say
++     that a transition time must be numeric.  */
++  if (!rfc8536 && g_strcmp0 (name, "UTC") =3D=3D 0)
+     {
+       *offset =3D 0;
+       return TRUE;
+     }
+=20
+   if (*name >=3D '0' && '9' >=3D *name)
+-    return parse_time (name, offset);
++    return parse_time (name, offset, rfc8536);
+=20
+   switch (*name++)
+     {
+     case 'Z':
+       *offset =3D 0;
+-      return !*name;
++      /* Internet RFC 8536 section 3.3.1 requires a numeric zone.  */
++      return !rfc8536 && !*name;
+=20
+     case '+':
+-      return parse_time (name, offset);
++      return parse_time (name, offset, rfc8536);
+=20
+     case '-':
+-      if (parse_time (name, offset))
++      if (parse_time (name, offset, rfc8536))
+         {
+           *offset =3D -*offset;
+           return TRUE;
+@@ -391,7 +421,7 @@ zone_for_constant_offset (GTimeZone *gtz, const gcha=
r *name)
+   gint32 offset;
+   TransitionInfo info;
+=20
+-  if (name =3D=3D NULL || !parse_constant_offset (name, &offset))
++  if (name =3D=3D NULL || !parse_constant_offset (name, &offset, FALSE)=
)
+     return;
+=20
+   info.gmt_offset =3D offset;
+@@ -529,12 +559,17 @@ init_zone_from_iana_info (GTimeZone *gtz,
+   guint8 *tz_transitions, *tz_type_index, *tz_ttinfo;
+   guint8 *tz_abbrs;
+   gsize timesize =3D sizeof (gint32);
+-  const struct tzhead *header =3D g_bytes_get_data (zoneinfo, &size);
++  gconstpointer header_data =3D g_bytes_get_data (zoneinfo, &size);
++  const gchar *data =3D header_data;
++  const struct tzhead *header =3D header_data;
++  GTimeZone *footertz =3D NULL;
++  guint extra_time_count =3D 0, extra_type_count =3D 0;
++  gint64 last_explicit_transition_time;
+=20
+   g_return_if_fail (size >=3D sizeof (struct tzhead) &&
+                     memcmp (header, "TZif", 4) =3D=3D 0);
+=20
+-  if (header->tzh_version =3D=3D '2')
++  if (header->tzh_version >=3D '2')
+       {
+         /* Skip ahead to the newer 64-bit data if it's available. */
+         header =3D (const struct tzhead *)
+@@ -550,6 +585,30 @@ init_zone_from_iana_info (GTimeZone *gtz,
+   time_count =3D guint32_from_be(header->tzh_timecnt);
+   type_count =3D guint32_from_be(header->tzh_typecnt);
+=20
++  if (header->tzh_version >=3D '2')
++    {
++      const gchar *footer =3D (((const gchar *) (header + 1))
++                             + guint32_from_be(header->tzh_ttisgmtcnt)
++                             + guint32_from_be(header->tzh_ttisstdcnt)
++                             + 12 * guint32_from_be(header->tzh_leapcnt=
)
++                             + 9 * time_count
++                             + 6 * type_count
++                             + guint32_from_be(header->tzh_charcnt));
++      const gchar *footerlast;
++      size_t footerlen;
++      g_return_if_fail (footer <=3D data + size - 2 && footer[0] =3D=3D=
 '\n');
++      footerlast =3D memchr (footer + 1, '\n', data + size - (footer + =
1));
++      g_return_if_fail (footerlast);
++      footerlen =3D footerlast + 1 - footer;
++      if (footerlen !=3D 2)
++        {
++          footertz =3D parse_footertz (footer, footerlen);
++          g_return_if_fail (footertz);
++          extra_type_count =3D footertz->t_info->len;
++          extra_time_count =3D footertz->transitions->len;
++        }
++    }
++
+   tz_transitions =3D ((guint8 *) (header) + sizeof (*header));
+   tz_type_index =3D tz_transitions + timesize * time_count;
+   tz_ttinfo =3D tz_type_index + time_count;
+@@ -557,9 +616,9 @@ init_zone_from_iana_info (GTimeZone *gtz,
+=20
+   gtz->name =3D g_steal_pointer (&identifier);
+   gtz->t_info =3D g_array_sized_new (FALSE, TRUE, sizeof (TransitionInf=
o),
+-                                   type_count);
++                                   type_count + extra_type_count);
+   gtz->transitions =3D g_array_sized_new (FALSE, TRUE, sizeof (Transiti=
on),
+-                                        time_count);
++                                        time_count + extra_time_count);
+=20
+   for (index =3D 0; index < type_count; index++)
+     {
+@@ -574,15 +633,50 @@ init_zone_from_iana_info (GTimeZone *gtz,
+   for (index =3D 0; index < time_count; index++)
+     {
+       Transition trans;
+-      if (header->tzh_version =3D=3D '2')
++      if (header->tzh_version >=3D '2')
+         trans.time =3D gint64_from_be (((gint64_be*)tz_transitions)[ind=
ex]);
+       else
+         trans.time =3D gint32_from_be (((gint32_be*)tz_transitions)[ind=
ex]);
++      last_explicit_transition_time =3D trans.time;
+       trans.info_index =3D tz_type_index[index];
+       g_assert (trans.info_index >=3D 0);
+       g_assert ((guint) trans.info_index < gtz->t_info->len);
+       g_array_append_val (gtz->transitions, trans);
+     }
++
++  if (footertz)
++    {
++      /* Append footer time types.  Don't bother to coalesce
++         duplicates with existing time types.  */
++      for (index =3D 0; index < extra_type_count; index++)
++        {
++          TransitionInfo t_info;
++          TransitionInfo *footer_t_info
++            =3D &g_array_index (footertz->t_info, TransitionInfo, index=
);
++          t_info.gmt_offset =3D footer_t_info->gmt_offset;
++          t_info.is_dst =3D footer_t_info->is_dst;
++          t_info.abbrev =3D g_steal_pointer (&footer_t_info->abbrev);
++          g_array_append_val (gtz->t_info, t_info);
++        }
++
++      /* Append footer transitions that follow the last explicit
++         transition.  */
++      for (index =3D 0; index < extra_time_count; index++)
++        {
++          Transition *footer_transition
++            =3D &g_array_index (footertz->transitions, Transition, inde=
x);
++          if (time_count <=3D 0
++              || last_explicit_transition_time < footer_transition->tim=
e)
++            {
++              Transition trans;
++              trans.time =3D footer_transition->time;
++              trans.info_index =3D type_count + footer_transition->info=
_index;
++              g_array_append_val (gtz->transitions, trans);
++            }
++        }
++
++      g_time_zone_unref (footertz);
++    }
+ }
+=20
+ #elif defined (G_OS_WIN32)
+@@ -590,9 +684,8 @@ init_zone_from_iana_info (GTimeZone *gtz,
+ static void
+ copy_windows_systemtime (SYSTEMTIME *s_time, TimeZoneDate *tzdate)
+ {
+-  tzdate->sec =3D s_time->wSecond;
+-  tzdate->min =3D s_time->wMinute;
+-  tzdate->hour =3D s_time->wHour;
++  tzdate->offset
++    =3D s_time->wHour * 3600 + s_time->wMinute * 60 + s_time->wSecond;
+   tzdate->mon =3D s_time->wMonth;
+   tzdate->year =3D s_time->wYear;
+   tzdate->wday =3D s_time->wDayOfWeek ? s_time->wDayOfWeek : 7;
+@@ -979,7 +1072,7 @@ boundary_for_year (TimeZoneDate *boundary,
+   g_date_clear (&date, 1);
+   g_date_set_dmy (&date, buffer.mday, buffer.mon, buffer.year);
+   return ((g_date_get_julian (&date) - unix_epoch_start) * seconds_per_=
day +
+-          buffer.hour * 3600 + buffer.min * 60 + buffer.sec - offset);
++          buffer.offset - offset);
+ }
+=20
+ static void
+@@ -1156,7 +1249,7 @@ init_zone_from_rules (GTimeZone    *gtz,
+  * - N is 0 to 365
+  *
+  * time is either h or hh[[:]mm[[[:]ss]]]
+- *  - h[h] is 0 to 23
++ *  - h[h] is 0 to 24
+  *  - mm is 00 to 59
+  *  - ss is 00 to 59
+  */
+@@ -1289,25 +1382,10 @@ parse_tz_boundary (const gchar  *identifier,
+   /* Time */
+=20
+   if (*pos =3D=3D '/')
+-    {
+-      gint32 offset;
+-
+-      if (!parse_time (++pos, &offset))
+-        return FALSE;
+-
+-      boundary->hour =3D offset / 3600;
+-      boundary->min =3D (offset / 60) % 60;
+-      boundary->sec =3D offset % 3600;
+-
+-      return TRUE;
+-    }
+-
++    return parse_constant_offset (pos + 1, &boundary->offset, TRUE);
+   else
+     {
+-      boundary->hour =3D 2;
+-      boundary->min =3D 0;
+-      boundary->sec =3D 0;
+-
++      boundary->offset =3D 2 * 60 * 60;
+       return *pos =3D=3D '\0';
+     }
+ }
+@@ -1341,7 +1419,7 @@ parse_offset (gchar **pos, gint32 *target)
+     ++(*pos);
+=20
+   buffer =3D g_strndup (target_pos, *pos - target_pos);
+-  ret =3D parse_constant_offset (buffer, target);
++  ret =3D parse_constant_offset (buffer, target, FALSE);
+   g_free (buffer);
+=20
+   return ret;
+@@ -1366,21 +1444,32 @@ parse_identifier_boundary (gchar **pos, TimeZone=
Date *target)
+ static gboolean
+ set_tz_name (gchar **pos, gchar *buffer, guint size)
+ {
++  gboolean quoted =3D **pos =3D=3D '<';
+   gchar *name_pos =3D *pos;
+   guint len;
+=20
+-  /* Name is ASCII alpha (Is this necessarily true?) */
+-  while (g_ascii_isalpha (**pos))
+-    ++(*pos);
++  if (quoted)
++    {
++      name_pos++;
++      do
++        ++(*pos);
++      while (g_ascii_isalnum (**pos) || **pos =3D=3D '-' || **pos =3D=3D=
 '+');
++      if (**pos !=3D '>')
++        return FALSE;
++    }
++  else
++    while (g_ascii_isalpha (**pos))
++      ++(*pos);
+=20
+-  /* Name should be three or more alphabetic characters */
++  /* Name should be three or more characters */
+   if (*pos - name_pos < 3)
+     return FALSE;
+=20
+-  memset (buffer, 0, NAME_SIZE);
++  memset (buffer, 0, size);
+   /* name_pos isn't 0-terminated, so we have to limit the length expres=
sly */
+   len =3D *pos - name_pos > size - 1 ? size - 1 : *pos - name_pos;
+   strncpy (buffer, name_pos, len);
++  *pos +=3D quoted;
+   return TRUE;
+ }
+=20
+@@ -1483,6 +1572,28 @@ rules_from_identifier (const gchar   *identifier,
+   return create_ruleset_from_rule (rules, &tzr);
+ }
+=20
++#ifdef G_OS_UNIX
++static GTimeZone *
++parse_footertz (const gchar *footer, size_t footerlen)
++{
++  gchar *tzstring =3D g_strndup (footer + 1, footerlen - 2);
++  GTimeZone *footertz =3D NULL;
++  gchar *ident;
++  TimeZoneRule *rules;
++  guint rules_num =3D rules_from_identifier (tzstring, &ident, &rules);
++  g_free (ident);
++  g_free (tzstring);
++  if (rules_num > 1)
++    {
++      footertz =3D g_slice_new0 (GTimeZone);
++      init_zone_from_rules (footertz, rules, rules_num, NULL);
++      footertz->ref_count++;
++    }
++  g_free (rules);
++  return footertz;
++}
++#endif
++
+ /* Construction {{{1 */
+ /**
+  * g_time_zone_new:
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.64.5.bb
index a1233e6926..a30c5215be 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://tzdata-update.patch \
            "
=20
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
--=20
2.25.1

