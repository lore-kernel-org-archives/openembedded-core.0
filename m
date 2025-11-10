Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56442CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:07:04 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48748.1762783616030815466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 06:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VVWs07Zh;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295ceaf8dacso30956655ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 06:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762783615; x=1763388415; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YacwOhv5hUL19HsrBdlNfdn3dnfzVLmn1AVcnjwRjTg=;
        b=VVWs07ZhDHewc5OpRyQ2ATjaIXF1eYxY6zHWcV9IkcEawIAz2PHWfa8NFpfaQmfmDQ
         0IGTaw2YR/i1O5KCsw0iTT9o9VHJ72kvN4iYEvOHJlMC5mjvCC1R1dsEN3yd8rvJ+Wip
         Geac4U64RiD5XvMbrLUudwwxxVrTrhs22EkrApQe3WlPLTWQy99z+n+/NPSa4L15WJ2H
         nJsPfNhddTo8LaykaNn99IUMAn0yU+k4vW0hVYOOFEpH42Iii/gDXFDg9GjHWIOlhMiV
         OfgapTnfLwKjA4K+GhY9SFGGs4iSSIue2HBy3zUhJ6E3FXUmA33YwJs1JoYcyr9j8gbp
         jARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783615; x=1763388415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YacwOhv5hUL19HsrBdlNfdn3dnfzVLmn1AVcnjwRjTg=;
        b=lxEyEGo6Sh3CezISnD5UUVMbPiRxO7UY6f7WnIBthbOhEuXuW9g782dxVeb5Lqmh1n
         iGRroJxabl+kcHHgjnUhA499cDEIDJLx1tcpzpmGERAOXPEpUoWT8/vMwkYV8W3+NPNE
         ix6v6f+/CNG4I/G7W9yYkUF4Q3FX1H0oCTXT80/L8p/pIsSEhVVbT66QUNX5wbX4f1k7
         2m2to6p/sPhm38LCCyKAj1i8noQo8iqqCqN2uqXqFqvNLZi0u2o3s2VqhZCPRXE1ytjE
         20FcbV9Nuzy1wgXCPJTnO6+RseE5YkpDzDOFyu1bz9Xj54ODFIKIsIOI4vz8kCTD7SDP
         A3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUjxhfGqOWwDlqywzjurOdiDjrJDQLY0p23Ou+3hNX3Z4LWqNrGeYFepb2GZzvoCDdBGE94lHuFIwqH5yDdteaSMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPb2KDdEJH04C2rkAN0mRTl8ax9yGenl8H/pRS3vKtDbr0tc90
	DaQetO8o+GNN+lssCFR4sJpikE47gTF43pZ8RDFNKnz2SlaluQcQSWX0M4ebLA/Uxb9f+QMKEsR
	DAxPTqLAsZYNJkbnII7A315sutGMpImo=
X-Gm-Gg: ASbGncty2fAmMBKYRnAQ0Sfc6q74OA7S97JYgSgBH6w7BncWk/lJo+2AiqIfr1aSL7H
	55bBJF5gUqh4v3bXiM7RBWA3Vlkh7MCmKG5Q1xovxaeMhFvOVnRzWhcE7oTiB4ODvxykSQ/e7BZ
	4QmgIlpqdKwOaifQWNe8ouMDRoT2jTEblqNAkTFnUWcJTbRlesx0AO5ZXw45KDbWcisli+Fu4Pw
	IwNcJJxXkRSHNLDv7Nh1uAeTU8PrTH3vDetN3bFrmFPqUisFkufcT9q9PANTkRdeHbjoQot
X-Google-Smtp-Source: AGHT+IHUvGJQv75hwLNwVBm1XAvUtV2IYwpimVIwxcUZSAVbiOSB12I6gzxClB2vHVQJNbRjasS+PCxhRphljVkYSjk=
X-Received: by 2002:a17:902:d549:b0:295:57cc:cfb5 with SMTP id
 d9443c01a7336-297e56d494amr117941795ad.37.1762783615143; Mon, 10 Nov 2025
 06:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-3-niko.mauno@vaisala.com> <AS1PR10MB56971268C925EB139090781BFDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <5b0a6b8b-73dd-45d6-a29f-ba856a14579b@vaisala.com>
In-Reply-To: <5b0a6b8b-73dd-45d6-a29f-ba856a14579b@vaisala.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 10 Nov 2025 15:06:43 +0100
X-Gm-Features: AWmQ_bk6Q2LWjdb5U2fHlDJ1b8eXrXYKghKO1RpClSTV_wmMWDqGMZGmGQFNTGU
Message-ID: <CAApg2=TOJFaG2Y=i_bTwNTTW8eqcGaiz+iiRjKf0MgqxHxphFQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="00000000000032572406433e0bdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 14:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226122

--00000000000032572406433e0bdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Thank you for posting this. After having a look at the current NVD
situation, I think that the removal of this file is premature,
because of the adding of the 2.0 JSON feeds
https://nvd.nist.gov/vuln/data-feeds#divJson20Feeds

So for people who want to use the NVD data directly from the source still,
I think it makes sense to implement the download
of the JSON 2.0 feeds (should be closer to the nvd-native than nvd2-native,
and *faster*) and then decommission both nvd1
and the current nvd2 (API based).

Kind regards,
Marta

On Tue, Nov 4, 2025 at 9:38=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com> =
wrote:

>
>
> On 11/3/25 17:26, Marko, Peter wrote:
> > This should be commented on by Marta, I'm not sure if she brought this
> back even though it was not working anymore.
> > In case it's accepted, contribution to yocto-docs should follow.
> >
> > Peter
> >
>
> Thanks for pointing this out Peter, I'll make a note to submit also
> relevant changes to yocto-docs as needed.
> -Niko
>
> >> -----Original Message-----
> >> From: Niko Mauno <niko.mauno@vaisala.com>
> >> Sent: Monday, November 3, 2025 15:32
> >> To: openembedded-core@lists.openembedded.org
> >> Cc: ross.burton@arm.com; rybczynska@gmail.com; Marko, Peter (FT D EU S=
K
> >> BFS1) <Peter.Marko@siemens.com>; Niko Mauno <niko.mauno@vaisala.com>
> >> Subject: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
> >>
> >> Since enabling NVD1 as NVD_DB_VERSION nowadays leads to BitBake failur=
e
> >>
> >>    WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE
> data (HTTP
> >> Error 403: Forbidden)
> >>    WARNING: cve-update-db-native-1.0-r0 do_fetch: Host IPs are
> 172.65.90.26,
> >> 172.65.90.25, 172.65.90.24, 172.65.90.27, 2606:4700:78::90:0:180,
> >> 2606:4700:78::90:0:183, 2606:4700:78::90:0:181, 2606:4700:78::90:0:182
> >>    WARNING: cve-update-db-native-1.0-r0 do_fetch: CVE database update
> failed
> >>    ERROR: cve-update-db-native-1.0-r0 do_unpack: Error executing a
> python
> >> function in exec_func_python() autogenerated:
> >>
> >> Remove the support for obsolete NVD1.
> >>
> >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> >> ---
> >>   meta/classes/cve-check.bbclass                |  8 +-
> >>   .../recipes-core/meta/cve-update-db-native.bb | 87
> +++----------------
> >>   2 files changed, 15 insertions(+), 80 deletions(-)
> >>
> >> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> >> index c63ebd56e1..259c699af2 100644
> >> --- a/meta/classes/cve-check.bbclass
> >> +++ b/meta/classes/cve-check.bbclass
> >> @@ -31,11 +31,11 @@
> >>   CVE_PRODUCT ??=3D "${BPN}"
> >>   CVE_VERSION ??=3D "${PV}"
> >>
> >> -# Possible database sources: NVD1, NVD2, FKIE
> >> +# Possible database sources: NVD2, FKIE
> >>   NVD_DB_VERSION ?=3D "FKIE"
> >>
> >>   # Use different file names for each database source, as they
> synchronize at
> >> different moments, so may be slightly different
> >> -CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> >> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if
> >> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD1' else 'nvdfkie_1-1.db'}"
> >> +CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> >> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdfkie_1-1.db'}"
> >>   CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if
> >> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
> >>   CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
> >>   CVE_CHECK_DB_FILE ?=3D
> >> "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
> >> @@ -108,8 +108,8 @@ python () {
> >>       extend_cve_status(d)
> >>
> >>       nvd_database_type =3D d.getVar("NVD_DB_VERSION")
> >> -    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
> >> -        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1,
> >> NVD2, FKIE. Defaulting to NVD2")
> >> +    if nvd_database_type not in ("NVD2", "FKIE"):
> >> +        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD2,
> >> FKIE. Defaulting to NVD2")
> >>           d.setVar("NVD_DB_VERSION", "NVD2")
> >>   }
> >>
> >> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-
> >> core/meta/cve-update-db-native.bb
> >> index 3a6dc95580..4423216be5 100644
> >> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> >> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> >> @@ -11,7 +11,6 @@ deltask do_compile
> >>   deltask do_install
> >>   deltask do_populate_sysroot
> >>
> >> -NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
> >>   FKIE_URL ?=3D "https://github.com/fkie-cad/nvd-json-data-
> >> feeds/releases/latest/download/CVE-"
> >>
> >>   # CVE database update interval, in seconds. By default: once a day
> (23*60*60).
> >> @@ -108,30 +107,12 @@ def cleanup_db_download(db_tmp_file):
> >>       if os.path.exists(db_tmp_file):
> >>           os.remove(db_tmp_file)
> >>
> >> -def db_file_names(d, year, is_nvd):
> >> -    if is_nvd:
> >> -        year_url =3D d.getVar('NVDCVE_URL') + str(year)
> >> -        meta_url =3D year_url + ".meta"
> >> -        json_url =3D year_url + ".json.gz"
> >> -        return json_url, meta_url
> >> +def db_file_names(d, year):
> >>       year_url =3D d.getVar('FKIE_URL') + str(year)
> >>       meta_url =3D year_url + ".meta"
> >>       json_url =3D year_url + ".json.xz"
> >>       return json_url, meta_url
> >>
> >> -def host_db_name(d, is_nvd):
> >> -    if is_nvd:
> >> -        return "nvd.nist.gov"
> >> -    return "github.com"
> >> -
> >> -def db_decompress(d, data, is_nvd):
> >> -    import gzip, lzma
> >> -
> >> -    if is_nvd:
> >> -        return gzip.decompress(data).decode('utf-8')
> >> -    # otherwise
> >> -    return lzma.decompress(data)
> >> -
> >>   def update_db_file(db_tmp_file, d):
> >>       """
> >>       Update the given database file
> >> @@ -139,12 +120,12 @@ def update_db_file(db_tmp_file, d):
> >>       import bb.progress
> >>       import bb.utils
> >>       from datetime import date
> >> +    import lzma
> >>       import sqlite3
> >>       import urllib
> >>
> >>       YEAR_START =3D 2002
> >>       cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
> >> -    is_nvd =3D d.getVar("NVD_DB_VERSION") =3D=3D "NVD1"
> >>
> >>       # Connect to database
> >>       conn =3D sqlite3.connect(db_tmp_file)
> >> @@ -155,7 +136,7 @@ def update_db_file(db_tmp_file, d):
> >>           for i, year in enumerate(range(YEAR_START, date.today().year
> + 1)):
> >>               bb.note("Updating %d" % year)
> >>               ph.update((float(i + 1) / total_years) * 100)
> >> -            json_url, meta_url =3D db_file_names(d, year, is_nvd)
> >> +            json_url, meta_url =3D db_file_names(d, year)
> >>
> >>               # Retrieve meta last modified date
> >>               try:
> >> @@ -164,7 +145,7 @@ def update_db_file(db_tmp_file, d):
> >>                   cve_f.write('Warning: CVE db update error, Unable to
> fetch CVE
> >> data.\n\n')
> >>                   bb.warn("Failed to fetch CVE data (%s)" % e)
> >>                   import socket
> >> -                result =3D socket.getaddrinfo(host_db_name(d, is_nvd)=
,
> 443,
> >> proto=3Dsocket.IPPROTO_TCP)
> >> +                result =3D socket.getaddrinfo("github.com", 443,
> >> proto=3Dsocket.IPPROTO_TCP)
> >>                   bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t
> in result)))
> >>                   return False
> >>
> >> @@ -192,7 +173,7 @@ def update_db_file(db_tmp_file, d):
> >>                   try:
> >>                       response =3D urllib.request.urlopen(json_url,
> >> timeout=3Dcve_socket_timeout)
> >>                       if response:
> >> -                        update_db(d, conn, db_decompress(d,
> response.read(), is_nvd))
> >> +                        update_db(conn,
> lzma.decompress(response.read()))
> >>                       conn.execute("insert or replace into META values
> (?, ?)", [year,
> >> last_modified]).close()
> >>                   except urllib.error.URLError as e:
> >>                       cve_f.write('Warning: CVE db update error, CVE
> data is
> >> outdated.\n\n')
> >> @@ -224,17 +205,14 @@ def initialize_db(conn):
> >>
> >>           c.close()
> >>
> >> -def parse_node_and_insert(conn, node, cveId, is_nvd):
> >> +def parse_node_and_insert(conn, node, cveId):
> >>       # Parse children node if needed
> >>       for child in node.get('children', ()):
> >> -        parse_node_and_insert(conn, child, cveId, is_nvd)
> >> +        parse_node_and_insert(conn, child, cveId)
> >>
> >> -    def cpe_generator(is_nvd):
> >> +    def cpe_generator():
> >>           match_string =3D "cpeMatch"
> >>           cpe_string =3D 'criteria'
> >> -        if is_nvd:
> >> -            match_string =3D "cpe_match"
> >> -            cpe_string =3D 'cpe23Uri'
> >>
> >>           for cpe in node.get(match_string, ()):
> >>               if not cpe['vulnerable']:
> >> @@ -290,44 +268,7 @@ def parse_node_and_insert(conn, node, cveId,
> is_nvd):
> >>                       # Save processing by representing as -.
> >>                       yield [cveId, vendor, product, '-', '', '', '']
> >>
> >> -    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?,
> ?)",
> >> cpe_generator(is_nvd)).close()
> >> -
> >> -def update_db_nvdjson(conn, jsondata):
> >> -    import json
> >> -    root =3D json.loads(jsondata)
> >> -
> >> -    for elt in root['CVE_Items']:
> >> -        if not elt['impact']:
> >> -            continue
> >> -
> >> -        accessVector =3D None
> >> -        vectorString =3D None
> >> -        cvssv2 =3D 0.0
> >> -        cvssv3 =3D 0.0
> >> -        cvssv4 =3D 0.0
> >> -        cveId =3D elt['cve']['CVE_data_meta']['ID']
> >> -        cveDesc =3D
> elt['cve']['description']['description_data'][0]['value']
> >> -        date =3D elt['lastModifiedDate']
> >> -        try:
> >> -            accessVector =3D
> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> >> -            vectorString =3D
> elt['impact']['baseMetricV2']['cvssV2']['vectorString']
> >> -            cvssv2 =3D
> elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> >> -        except KeyError:
> >> -            cvssv2 =3D 0.0
> >> -        try:
> >> -            accessVector =3D accessVector or
> >> elt['impact']['baseMetricV3']['cvssV3']['attackVector']
> >> -            vectorString =3D vectorString or
> >> elt['impact']['baseMetricV3']['cvssV3']['vectorString']
> >> -            cvssv3 =3D
> elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> >> -        except KeyError:
> >> -            accessVector =3D accessVector or "UNKNOWN"
> >> -            cvssv3 =3D 0.0
> >> -
> >> -        conn.execute("insert or replace into NVD values (?, ?, ?, ?,
> ?, ?, ?, ?)",
> >> -                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date,
> accessVector,
> >> vectorString]).close()
> >> -
> >> -        configurations =3D elt['configurations']['nodes']
> >> -        for config in configurations:
> >> -            parse_node_and_insert(conn, config, cveId, True)
> >> +    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?,
> ?)",
> >> cpe_generator()).close()
> >>
> >>   def get_metric_entry(metric):
> >>       primaries =3D [c for c in metric if c['type'] =3D=3D "Primary"]
> >> @@ -338,7 +279,7 @@ def get_metric_entry(metric):
> >>           return secondaries[0]
> >>       return None
> >>
> >> -def update_db_fkie(conn, jsondata):
> >> +def update_db(conn, jsondata):
> >>       import json
> >>       root =3D json.loads(jsondata)
> >>
> >> @@ -403,13 +344,7 @@ def update_db_fkie(conn, jsondata):
> >>           for config in elt['configurations']:
> >>               # This is suboptimal as it doesn't handle AND/OR and
> negate, but is
> >> better than nothing
> >>               for node in config.get("nodes") or []:
> >> -                parse_node_and_insert(conn, node, cveId, False)
> >> -
> >> -def update_db(d, conn, jsondata):
> >> -    if (d.getVar("NVD_DB_VERSION") =3D=3D "FKIE"):
> >> -        return update_db_fkie(conn, jsondata)
> >> -    else:
> >> -        return update_db_nvdjson(conn, jsondata)
> >> +                parse_node_and_insert(conn, node, cveId)
> >>
> >>   do_fetch[nostamp] =3D "1"
> >>
> >> --
> >> 2.47.3
> >
>
>

--00000000000032572406433e0bdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>Thank you for posting this. After ha=
ving a look at the current NVD situation, I think that the removal of this =
file is premature,</div><div>because of the adding of the 2.0 JSON feeds <a=
 href=3D"https://nvd.nist.gov/vuln/data-feeds#divJson20Feeds">https://nvd.n=
ist.gov/vuln/data-feeds#divJson20Feeds</a></div><div><br></div><div>So for =
people who want to use the NVD data directly from the source still, I think=
 it makes sense to implement the download</div><div>of the JSON 2.0 feeds (=
should be closer to the nvd-native than nvd2-native, and *faster*) and then=
 decommission both nvd1</div><div>and the current nvd2 (API based).<br></di=
v><div><br></div><div>Kind regards,</div><div>Marta<br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Nov 4, 2025 at 9:38=E2=80=AFAM Niko Mauno &lt;<a href=3D"mailto:n=
iko.mauno@vaisala.com">niko.mauno@vaisala.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/3/25 17:26, Marko, Peter wrote:<br>
&gt; This should be commented on by Marta, I&#39;m not sure if she brought =
this back even though it was not working anymore.<br>
&gt; In case it&#39;s accepted, contribution to yocto-docs should follow.<b=
r>
&gt; <br>
&gt; Peter<br>
&gt; <br>
<br>
Thanks for pointing this out Peter, I&#39;ll make a note to submit also rel=
evant changes to yocto-docs as needed.<br>
-Niko<br>
<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt;&gt; Sent: Monday, November 3, 2025 15:32<br>
&gt;&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; Cc: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.=
burton@arm.com</a>; <a href=3D"mailto:rybczynska@gmail.com" target=3D"_blan=
k">rybczynska@gmail.com</a>; Marko, Peter (FT D EU SK<br>
&gt;&gt; BFS1) &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_bl=
ank">Peter.Marko@siemens.com</a>&gt;; Niko Mauno &lt;<a href=3D"mailto:niko=
.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt;&gt; Subject: [PATCH 3/5] cve-update: Drop obsolete NVD1 support<br>
&gt;&gt;<br>
&gt;&gt; Since enabling NVD1 as NVD_DB_VERSION nowadays leads to BitBake fa=
ilure<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed=
 to fetch CVE data (HTTP<br>
&gt;&gt; Error 403: Forbidden)<br>
&gt;&gt;=C2=A0 =C2=A0 WARNING: cve-update-db-native-1.0-r0 do_fetch: Host I=
Ps are 172.65.90.26,<br>
&gt;&gt; 172.65.90.25, 172.65.90.24, 172.65.90.27, 2606:4700:78::90:0:180,<=
br>
&gt;&gt; 2606:4700:78::90:0:183, 2606:4700:78::90:0:181, 2606:4700:78::90:0=
:182<br>
&gt;&gt;=C2=A0 =C2=A0 WARNING: cve-update-db-native-1.0-r0 do_fetch: CVE da=
tabase update failed<br>
&gt;&gt;=C2=A0 =C2=A0 ERROR: cve-update-db-native-1.0-r0 do_unpack: Error e=
xecuting a python<br>
&gt;&gt; function in exec_func_python() autogenerated:<br>
&gt;&gt;<br>
&gt;&gt; Remove the support for obsolete NVD1.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala=
.com" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +-<br>
&gt;&gt;=C2=A0 =C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-=
native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a>=
 | 87 +++----------------<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 15 insertions(+), 80 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-che=
ck.bbclass<br>
&gt;&gt; index c63ebd56e1..259c699af2 100644<br>
&gt;&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt;&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt;&gt; @@ -31,11 +31,11 @@<br>
&gt;&gt;=C2=A0 =C2=A0CVE_PRODUCT ??=3D &quot;${BPN}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0CVE_VERSION ??=3D &quot;${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -# Possible database sources: NVD1, NVD2, FKIE<br>
&gt;&gt; +# Possible database sources: NVD2, FKIE<br>
&gt;&gt;=C2=A0 =C2=A0NVD_DB_VERSION ?=3D &quot;FKIE&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# Use different file names for each database source, a=
s they synchronize at<br>
&gt;&gt; different moments, so may be slightly different<br>
&gt;&gt; -CVE_CHECK_DB_FILENAME ?=3D &quot;${@&#39;nvdcve_2-2.db&#39; if<br=
>
&gt;&gt; d.getVar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD2&#39; else &#39=
;nvdcve_1-3.db&#39; if<br>
&gt;&gt; d.getVar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD1&#39; else &#39=
;nvdfkie_1-1.db&#39;}&quot;<br>
&gt;&gt; +CVE_CHECK_DB_FILENAME ?=3D &quot;${@&#39;nvdcve_2-2.db&#39; if<br=
>
&gt;&gt; d.getVar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD2&#39; else &#39=
;nvdfkie_1-1.db&#39;}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0CVE_CHECK_DB_FETCHER ?=3D &quot;${@&#39;cve-update-nvd=
2-native&#39; if<br>
&gt;&gt; d.getVar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD2&#39; else &#39=
;cve-update-db-native&#39;}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0CVE_CHECK_DB_DIR ?=3D &quot;${STAGING_DIR}/CVE_CHECK&q=
uot;<br>
&gt;&gt;=C2=A0 =C2=A0CVE_CHECK_DB_FILE ?=3D<br>
&gt;&gt; &quot;${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}&quot;<br>
&gt;&gt; @@ -108,8 +108,8 @@ python () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0extend_cve_status(d)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nvd_database_type =3D d.getVar(&quot;NVD=
_DB_VERSION&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 if nvd_database_type not in (&quot;NVD1&quot;, &quo=
t;NVD2&quot;, &quot;FKIE&quot;):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.erroronce(&quot;Malformed NVD_DB_V=
ERSION, must be one of: NVD1,<br>
&gt;&gt; NVD2, FKIE. Defaulting to NVD2&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if nvd_database_type not in (&quot;NVD2&quot;, &quo=
t;FKIE&quot;):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.erroronce(&quot;Malformed NVD_DB_V=
ERSION, must be one of: NVD2,<br>
&gt;&gt; FKIE. Defaulting to NVD2&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;NVD_DB_VERS=
ION&quot;, &quot;NVD2&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-d=
b-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</=
a> b/meta/recipes-<br>
&gt;&gt; core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt;&gt; index 3a6dc95580..4423216be5 100644<br>
&gt;&gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt;&gt; @@ -11,7 +11,6 @@ deltask do_compile<br>
&gt;&gt;=C2=A0 =C2=A0deltask do_install<br>
&gt;&gt;=C2=A0 =C2=A0deltask do_populate_sysroot<br>
&gt;&gt;<br>
&gt;&gt; -NVDCVE_URL ?=3D &quot;<a href=3D"https://nvd.nist.gov/feeds/json/=
cve/1.1/nvdcve-1.1-" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.=
gov/feeds/json/cve/1.1/nvdcve-1.1-</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0FKIE_URL ?=3D &quot;<a href=3D"https://github.com/fkie=
-cad/nvd-json-data-" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/fkie-cad/nvd-json-data-</a><br>
&gt;&gt; feeds/releases/latest/download/CVE-&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# CVE database update interval, in seconds. By default=
: once a day (23*60*60).<br>
&gt;&gt; @@ -108,30 +107,12 @@ def cleanup_db_download(db_tmp_file):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(db_tmp_file):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(db_tmp_file)<br>
&gt;&gt;<br>
&gt;&gt; -def db_file_names(d, year, is_nvd):<br>
&gt;&gt; -=C2=A0 =C2=A0 if is_nvd:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 year_url =3D d.getVar(&#39;NVDCVE_URL=
&#39;) + str(year)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_url =3D year_url + &quot;.meta&q=
uot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 json_url =3D year_url + &quot;.json.g=
z&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return json_url, meta_url<br>
&gt;&gt; +def db_file_names(d, year):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0year_url =3D d.getVar(&#39;FKIE_URL&#39;=
) + str(year)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta_url =3D year_url + &quot;.meta&quot=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0json_url =3D year_url + &quot;.json.xz&q=
uot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return json_url, meta_url<br>
&gt;&gt;<br>
&gt;&gt; -def host_db_name(d, is_nvd):<br>
&gt;&gt; -=C2=A0 =C2=A0 if is_nvd:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;<a href=3D"http://nvd.ni=
st.gov" rel=3D"noreferrer" target=3D"_blank">nvd.nist.gov</a>&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 return &quot;<a href=3D"http://github.com" rel=3D"n=
oreferrer" target=3D"_blank">github.com</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -def db_decompress(d, data, is_nvd):<br>
&gt;&gt; -=C2=A0 =C2=A0 import gzip, lzma<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 if is_nvd:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gzip.decompress(data).decode(&=
#39;utf-8&#39;)<br>
&gt;&gt; -=C2=A0 =C2=A0 # otherwise<br>
&gt;&gt; -=C2=A0 =C2=A0 return lzma.decompress(data)<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0def update_db_file(db_tmp_file, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Update the given database file<br>
&gt;&gt; @@ -139,12 +120,12 @@ def update_db_file(db_tmp_file, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import bb.progress<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import bb.utils<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from datetime import date<br>
&gt;&gt; +=C2=A0 =C2=A0 import lzma<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import sqlite3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import urllib<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0YEAR_START =3D 2002<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cve_socket_timeout =3D int(d.getVar(&quo=
t;CVE_SOCKET_TIMEOUT&quot;))<br>
&gt;&gt; -=C2=A0 =C2=A0 is_nvd =3D d.getVar(&quot;NVD_DB_VERSION&quot;) =3D=
=3D &quot;NVD1&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Connect to database<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0conn =3D sqlite3.connect(db_tmp_file)<br=
>
&gt;&gt; @@ -155,7 +136,7 @@ def update_db_file(db_tmp_file, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i, year in enumerate(r=
ange(YEAR_START, date.today().year + 1)):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quo=
t;Updating %d&quot; % year)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ph.update((f=
loat(i + 1) / total_years) * 100)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_url, meta_url =3D =
db_file_names(d, year, is_nvd)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_url, meta_url =3D =
db_file_names(d, year)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Retrieve m=
eta last modified date<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt; @@ -164,7 +145,7 @@ def update_db_file(db_tmp_file, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cve_f.write(&#39;Warning: CVE db update error, Unable to fetch CVE<br>
&gt;&gt; data.\n\n&#39;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.warn(&quot;Failed to fetch CVE data (%s)&quot; % e)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0import socket<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =
=3D socket.getaddrinfo(host_db_name(d, is_nvd), 443,<br>
&gt;&gt; proto=3Dsocket.IPPROTO_TCP)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =
=3D socket.getaddrinfo(&quot;<a href=3D"http://github.com" rel=3D"noreferre=
r" target=3D"_blank">github.com</a>&quot;, 443,<br>
&gt;&gt; proto=3Dsocket.IPPROTO_TCP)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.warn(&quot;Host IPs are %s&quot; % (&quot;, &quot;.join(t[4][0] for t=
 in result)))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return False<br>
&gt;&gt;<br>
&gt;&gt; @@ -192,7 +173,7 @@ def update_db_file(db_tmp_file, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0try:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0response =3D urllib.request.urlopen(json_url,<br>
&gt;&gt; timeout=3Dcve_socket_timeout)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if response:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 update_db(d, conn, db_decompress(d, response.read(), i=
s_nvd))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 update_db(conn, lzma.decompress(response.read()))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0conn.execute(&quot;insert or replace into META values (?, =
?)&quot;, [year,<br>
&gt;&gt; last_modified]).close()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0except urllib.error.URLError as e:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cve_f.write(&#39;Warning: CVE db update error, CVE data is=
<br>
&gt;&gt; outdated.\n\n&#39;)<br>
&gt;&gt; @@ -224,17 +205,14 @@ def initialize_db(conn):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.close()<br>
&gt;&gt;<br>
&gt;&gt; -def parse_node_and_insert(conn, node, cveId, is_nvd):<br>
&gt;&gt; +def parse_node_and_insert(conn, node, cveId):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Parse children node if needed<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for child in node.get(&#39;children&#39;=
, ()):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(conn, child, cv=
eId, is_nvd)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(conn, child, cv=
eId)<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 def cpe_generator(is_nvd):<br>
&gt;&gt; +=C2=A0 =C2=A0 def cpe_generator():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match_string =3D &quot;cpe=
Match&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpe_string =3D &#39;criter=
ia&#39;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_nvd:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_string =3D &quot;=
cpe_match&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpe_string =3D &#39;cpe=
23Uri&#39;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cpe in node.get(match_=
string, ()):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not cpe[&=
#39;vulnerable&#39;]:<br>
&gt;&gt; @@ -290,44 +268,7 @@ def parse_node_and_insert(conn, node, cveId, =
is_nvd):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Save processing by representing as -.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0yield [cveId, vendor, product, &#39;-&#39;, &#39;&#39;, &#=
39;&#39;, &#39;&#39;]<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 conn.executemany(&quot;insert into PRODUCTS values =
(?, ?, ?, ?, ?, ?, ?)&quot;,<br>
&gt;&gt; cpe_generator(is_nvd)).close()<br>
&gt;&gt; -<br>
&gt;&gt; -def update_db_nvdjson(conn, jsondata):<br>
&gt;&gt; -=C2=A0 =C2=A0 import json<br>
&gt;&gt; -=C2=A0 =C2=A0 root =3D json.loads(jsondata)<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 for elt in root[&#39;CVE_Items&#39;]:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt[&#39;impact&#39;]:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D None<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D None<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D 0.0<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D 0.0<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv4 =3D 0.0<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cveId =3D elt[&#39;cve&#39;][&#39;CVE=
_data_meta&#39;][&#39;ID&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cveDesc =3D elt[&#39;cve&#39;][&#39;d=
escription&#39;][&#39;description_data&#39;][0][&#39;value&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 date =3D elt[&#39;lastModifiedDate&#3=
9;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#=
39;impact&#39;][&#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;accessVector=
&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D elt[&#=
39;impact&#39;][&#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;vectorString=
&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D elt[&#39;imp=
act&#39;][&#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;baseScore&#39;]<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D 0.0<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D access=
Vector or<br>
&gt;&gt; elt[&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#=
39;attackVector&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vector=
String or<br>
&gt;&gt; elt[&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#=
39;vectorString&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D elt[&#39;imp=
act&#39;][&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#39;baseScore&#39;]<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D access=
Vector or &quot;UNKNOWN&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D 0.0<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.execute(&quot;insert or replace =
into NVD values (?, ?, ?, ?, ?, ?, ?, ?)&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [cveId, c=
veDesc, cvssv2, cvssv3, cvssv4, date, accessVector,<br>
&gt;&gt; vectorString]).close()<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurations =3D elt[&#39;configura=
tions&#39;][&#39;nodes&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in configurations:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(c=
onn, config, cveId, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 conn.executemany(&quot;insert into PRODUCTS values =
(?, ?, ?, ?, ?, ?, ?)&quot;,<br>
&gt;&gt; cpe_generator()).close()<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0def get_metric_entry(metric):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0primaries =3D [c for c in metric if c[&#=
39;type&#39;] =3D=3D &quot;Primary&quot;]<br>
&gt;&gt; @@ -338,7 +279,7 @@ def get_metric_entry(metric):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return secondaries[0]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
&gt;&gt;<br>
&gt;&gt; -def update_db_fkie(conn, jsondata):<br>
&gt;&gt; +def update_db(conn, jsondata):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import json<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root =3D json.loads(jsondata)<br>
&gt;&gt;<br>
&gt;&gt; @@ -403,13 +344,7 @@ def update_db_fkie(conn, jsondata):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in elt[&#39;con=
figurations&#39;]:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This is su=
boptimal as it doesn&#39;t handle AND/OR and negate, but is<br>
&gt;&gt; better than nothing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for node in =
config.get(&quot;nodes&quot;) or []:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_nod=
e_and_insert(conn, node, cveId, False)<br>
&gt;&gt; -<br>
&gt;&gt; -def update_db(d, conn, jsondata):<br>
&gt;&gt; -=C2=A0 =C2=A0 if (d.getVar(&quot;NVD_DB_VERSION&quot;) =3D=3D &qu=
ot;FKIE&quot;):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return update_db_fkie(conn, jsondata)=
<br>
&gt;&gt; -=C2=A0 =C2=A0 else:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return update_db_nvdjson(conn, jsonda=
ta)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_nod=
e_and_insert(conn, node, cveId)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0do_fetch[nostamp] =3D &quot;1&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.47.3<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000032572406433e0bdd--

