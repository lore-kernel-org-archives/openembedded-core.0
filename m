Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CD4C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:55:39 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.134077.1680710133998184073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b2i8y8og;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-4fa3c1a7a41so522337a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680710132; x=1683302132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL/YO0WoqTSPj//AdEmBvEiJw6SZbNmxpQ1ks1QZ3R8=;
        b=b2i8y8og3wSmaIhJLYqmCuzz+GvykBhi449arkR0p8aQRgL3yHpIFOZp3GCgIxLefE
         hiRbppCV2stjeL5RLgYxj39X/wqg/G8Cy0JadB8SEgmFCPx3MGn60hINEGlnCNYMxyjs
         9efJcdiLElyF/1r0475FOHe+caaBzpG/VH+7za2qiwi9j6mwxPnMnbO214ueZDo2Vkkk
         HUhO0m2avSN1suizs+O1Cl63S2DI5GA5eKBFNM1oN/gMMDxCnN94AleuTMBrN/5l45Ed
         JXCr/pI5e+Lfjkg18EOlRmF3ZxDJYJ/QeQv7XWMWGnSdWZVdOq2sjjj5eGoxTAu/37u/
         VbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710132; x=1683302132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL/YO0WoqTSPj//AdEmBvEiJw6SZbNmxpQ1ks1QZ3R8=;
        b=7QoXjKW11F8fcCBoDlrbeABBpccVxk/d4tyyUFVpmVujnVU54fHNM0Xw2esfPaIItR
         RAg+mdoP5P/apzsGk70bQ6DdtERg4nwIRWkbay3ATu/rQgJ8vLdrLQ+kX8/BdDRgKOYQ
         bjmDmo0peAmV0FiNs3O1TJuy8HGlgab7zhj0fQhOfNHoKiQjcsmfwFevVcAHMN6uOIo9
         NgSdYp0VDHJp739F5SHbSXGlK5sLL8a8xc9DH2achCU4yqgH++lV+/nUaQ1EUhmN5pds
         GVpAkENdi+x39hQ1bFf5X6OlwnPqdnd9IsO1HVWXPjmMC3Xa2zYBKlH6gu1KyRiq9NdM
         N5Og==
X-Gm-Message-State: AAQBX9dkv5wm2nOxx+7r08+TaPwXywEfnzXE2cg3LIcTbl09lJsLFcwl
	uiNeD7UzPcW2dFNucYg32xJBnlu8ZmAiRYMqeVlVnA==
X-Google-Smtp-Source: AKy350bHTE0m1NLzyIusnoJI4cC6mKsyf3K1oyL0a3hfztCutyR1b6ARxe3eDfRto/gVTizijnLsNybS8dqMBPPu4Y4=
X-Received: by 2002:a50:d6c3:0:b0:4fb:2593:844 with SMTP id
 l3-20020a50d6c3000000b004fb25930844mr1463442edj.2.1680710132134; Wed, 05 Apr
 2023 08:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230329100257.1612928-1-rybczynska@gmail.com>
In-Reply-To: <20230329100257.1612928-1-rybczynska@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 5 Apr 2023 05:55:21 -1000
Message-ID: <CAOSpxdYdF8K7bWcc_DCjEt26-ExdYHMSZt1RJgyRoqj0Zm4TTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: new CVE database fetcher
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179743

Hi Marta,

Is this safe to backport to the stable branches, or should I let it
"age" in master for a while?

Thanks!

Steve

On Wed, Mar 29, 2023 at 12:03=E2=80=AFAM Marta Rybczynska <rybczynska@gmail=
.com> wrote:
>
> Add new fetcher for the NVD database using the 2.0 API [1].
> The implementation changes as little as possible, keeping the current
> database format (but using a different database file for the transition
> period), with a notable exception of not using the META table.
>
> Minor changes that could be visible:
> - the database starts in 1999 instead of 2002
> - the complete fetch is longer (30 minutes typically)
>
> [1] https://nvd.nist.gov/developers/vulnerabilities
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> ---
>  meta/classes/cve-check.bbclass                |   4 +-
>  .../meta/cve-update-nvd2-native.bb            | 333 ++++++++++++++++++
>  2 files changed, 335 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 41fdf8363f..1f16683c32 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -32,7 +32,7 @@ CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>
>  CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
> -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
> +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
>  CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
>
>  CVE_CHECK_LOG ?=3D "${T}/cve.log"
> @@ -161,7 +161,7 @@ python do_cve_check () {
>  }
>
>  addtask cve_check before do_build
> -do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
> +do_cve_check[depends] =3D "cve-update-nvd2-native:do_fetch"
>  do_cve_check[nostamp] =3D "1"
>
>  python cve_check_cleanup () {
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> new file mode 100644
> index 0000000000..1c14481c21
> --- /dev/null
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -0,0 +1,333 @@
> +SUMMARY =3D "Updates the NVD CVE database"
> +LICENSE =3D "MIT"
> +
> +# Important note:
> +# This product uses the NVD API but is not endorsed or certified by the =
NVD.
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit native
> +
> +deltask do_unpack
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +
> +NVDCVE_URL ?=3D "https://services.nvd.nist.gov/rest/json/cves/2.0"
> +
> +# CVE database update interval, in seconds. By default: once a day (24*6=
0*60).
> +# Use 0 to force the update
> +# Use a negative value to skip the update
> +CVE_DB_UPDATE_INTERVAL ?=3D "86400"
> +
> +# Timeout for blocking socket operations, such as the connection attempt=
.
> +CVE_SOCKET_TIMEOUT ?=3D "60"
> +
> +CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
> +
> +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
> +
> +python () {
> +    if not bb.data.inherits_class("cve-check", d):
> +        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is n=
ot loaded.")
> +}
> +
> +python do_fetch() {
> +    """
> +    Update NVD database with API 2.0
> +    """
> +    import bb.utils
> +    import bb.progress
> +    import shutil
> +
> +    bb.utils.export_proxies(d)
> +
> +    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
> +    db_dir =3D os.path.dirname(db_file)
> +    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
> +
> +    cleanup_db_download(db_file, db_tmp_file)
> +    # By default let's update the whole database (since time 0)
> +    database_time =3D 0
> +
> +    # The NVD database changes once a day, so no need to update more fre=
quently
> +    # Allow the user to force-update
> +    try:
> +        import time
> +        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
> +        if update_interval < 0:
> +            bb.note("CVE database update skipped")
> +            return
> +        if time.time() - os.path.getmtime(db_file) < update_interval:
> +            bb.note("CVE database recently updated, skipping")
> +            return
> +        database_time =3D os.path.getmtime(db_file)
> +
> +    except OSError:
> +        pass
> +
> +    bb.utils.mkdirhier(db_dir)
> +    if os.path.exists(db_file):
> +        shutil.copy2(db_file, db_tmp_file)
> +
> +    if update_db_file(db_tmp_file, d, database_time) =3D=3D True:
> +        # Update downloaded correctly, can swap files
> +        shutil.move(db_tmp_file, db_file)
> +    else:
> +        # Update failed, do not modify the database
> +        bb.warn("CVE database update failed")
> +        os.remove(db_tmp_file)
> +}
> +
> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
> +do_fetch[file-checksums] =3D ""
> +do_fetch[vardeps] =3D ""
> +
> +def cleanup_db_download(db_file, db_tmp_file):
> +    """
> +    Cleanup the download space from possible failed downloads
> +    """
> +
> +    # Clean up the updates done on the main file
> +    # Remove it only if a journal file exists - it means a complete re-d=
ownload
> +    if os.path.exists("{0}-journal".format(db_file)):
> +        # If a journal is present the last update might have been interr=
upted. In that case,
> +        # just wipe any leftovers and force the DB to be recreated.
> +        os.remove("{0}-journal".format(db_file))
> +
> +        if os.path.exists(db_file):
> +            os.remove(db_file)
> +
> +    # Clean-up the temporary file downloads, we can remove both journal
> +    # and the temporary database
> +    if os.path.exists("{0}-journal".format(db_tmp_file)):
> +        # If a journal is present the last update might have been interr=
upted. In that case,
> +        # just wipe any leftovers and force the DB to be recreated.
> +        os.remove("{0}-journal".format(db_tmp_file))
> +
> +    if os.path.exists(db_tmp_file):
> +        os.remove(db_tmp_file)
> +
> +def nvd_request_next(url, api_key, args):
> +    """
> +    Request next part of the NVD dabase
> +    """
> +
> +    import urllib.request
> +    import urllib.parse
> +    import gzip
> +
> +    headers =3D {}
> +    if api_key:
> +        headers['apiKey'] =3D api_key
> +
> +    data =3D urllib.parse.urlencode(args)
> +
> +    full_request =3D url + '?' + data
> +
> +    for attempt in range(3):
> +        try:
> +            r =3D urllib.request.urlopen(full_request)
> +
> +            if (r.headers['content-encoding'] =3D=3D 'gzip'):
> +                buf =3D r.read()
> +                raw_data =3D gzip.decompress(buf)
> +            else:
> +                raw_data =3D r.read().decode("utf-8")
> +
> +            r.close()
> +
> +        except UnicodeDecodeError:
> +            # Received garbage, retry
> +            bb.debug(2, "CVE database: received malformed data, retrying=
 (request: %s)" %(full_request))
> +            pass
> +        except http.client.IncompleteRead:
> +            # Read incomplete, let's try again
> +            bb.debug(2, "CVE database: received incomplete data, retryin=
g (request: %s)" %(full_request))
> +            pass
> +        else:
> +            return raw_data
> +    else:
> +        # We failed at all attempts
> +        return None
> +
> +def update_db_file(db_tmp_file, d, database_time):
> +    """
> +    Update the given database file
> +    """
> +    import bb.utils, bb.progress
> +    import datetime
> +    import sqlite3
> +    import json
> +
> +    # Connect to database
> +    conn =3D sqlite3.connect(db_tmp_file)
> +    initialize_db(conn)
> +
> +    req_args =3D {'startIndex' : 0}
> +
> +    # The maximum range for time is 120 days
> +    # Force a complete update if our range is longer
> +    if (database_time !=3D 0):
> +        database_date =3D datetime.datetime.combine(datetime.date.fromti=
mestamp(database_time), datetime.time())
> +        today_date =3D datetime.datetime.combine(datetime.date.today(), =
datetime.time())
> +        delta =3D today_date - database_date
> +        if delta.days < 120:
> +            bb.debug(2, "CVE database: performing partial update")
> +            req_args['lastModStartDate'] =3D database_date.isoformat()
> +            req_args['lastModEndDate'] =3D today_date.isoformat()
> +        else:
> +            bb.note("CVE database: file too old, forcing a full update")
> +
> +    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
> +
> +        bb.debug(2, "Updating entries")
> +        index =3D 0
> +        url =3D d.getVar("NVDCVE_URL")
> +        while True:
> +            req_args['startIndex'] =3D index
> +            raw_data =3D nvd_request_next(url, None, req_args)
> +            if raw_data is None:
> +                # We haven't managed to download data
> +                return False
> +
> +            data =3D json.loads(raw_data)
> +
> +            index =3D data["startIndex"]
> +            total =3D data["totalResults"]
> +            per_page =3D data["resultsPerPage"]
> +
> +            for cve in data["vulnerabilities"]:
> +               update_db(conn, cve)
> +
> +            index +=3D per_page
> +            ph.update((float(index) / (total+1)) * 100)
> +            if index >=3D total:
> +               break
> +
> +            # Recommended by NVD
> +            time.sleep(6)
> +
> +        # Update success, set the date to cve_check file.
> +        cve_f.write('CVE database update : %s\n\n' % datetime.date.today=
())
> +
> +    conn.commit()
> +    conn.close()
> +    return True
> +
> +def initialize_db(conn):
> +    with conn:
> +        c =3D conn.cursor()
> +
> +        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
> +
> +        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
> +            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
> +
> +        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
> +            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
> +            VERSION_END TEXT, OPERATOR_END TEXT)")
> +        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS=
(ID);")
> +
> +        c.close()
> +
> +def parse_node_and_insert(conn, node, cveId):
> +
> +    def cpe_generator():
> +        for cpe in node.get('cpeMatch', ()):
> +            if not cpe['vulnerable']:
> +                return
> +            cpe23 =3D cpe.get('criteria')
> +            if not cpe23:
> +                return
> +            cpe23 =3D cpe23.split(':')
> +            if len(cpe23) < 6:
> +                return
> +            vendor =3D cpe23[3]
> +            product =3D cpe23[4]
> +            version =3D cpe23[5]
> +
> +            if cpe23[6] =3D=3D '*' or cpe23[6] =3D=3D '-':
> +                version_suffix =3D ""
> +            else:
> +                version_suffix =3D "_" + cpe23[6]
> +
> +            if version !=3D '*' and version !=3D '-':
> +                # Version is defined, this is a '=3D' match
> +                yield [cveId, vendor, product, version + version_suffix,=
 '=3D', '', '']
> +            elif version =3D=3D '-':
> +                # no version information is available
> +                yield [cveId, vendor, product, version, '', '', '']
> +            else:
> +                # Parse start version, end version and operators
> +                op_start =3D ''
> +                op_end =3D ''
> +                v_start =3D ''
> +                v_end =3D ''
> +
> +                if 'versionStartIncluding' in cpe:
> +                    op_start =3D '>=3D'
> +                    v_start =3D cpe['versionStartIncluding']
> +
> +                if 'versionStartExcluding' in cpe:
> +                    op_start =3D '>'
> +                    v_start =3D cpe['versionStartExcluding']
> +
> +                if 'versionEndIncluding' in cpe:
> +                    op_end =3D '<=3D'
> +                    v_end =3D cpe['versionEndIncluding']
> +
> +                if 'versionEndExcluding' in cpe:
> +                    op_end =3D '<'
> +                    v_end =3D cpe['versionEndExcluding']
> +
> +                if op_start or op_end or v_start or v_end:
> +                    yield [cveId, vendor, product, v_start, op_start, v_=
end, op_end]
> +                else:
> +                    # This is no version information, expressed differen=
tly.
> +                    # Save processing by representing as -.
> +                    yield [cveId, vendor, product, '-', '', '', '']
> +
> +    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
, cpe_generator()).close()
> +
> +def update_db(conn, elt):
> +    """
> +    Update a single entry in the on-disk database
> +    """
> +
> +    accessVector =3D None
> +    cveId =3D elt['cve']['id']
> +    if elt['cve']['vulnStatus'] =3D=3D  "Rejected":
> +        return
> +    cveDesc =3D ""
> +    for desc in elt['cve']['descriptions']:
> +        if desc['lang'] =3D=3D 'en':
> +            cveDesc =3D desc['value']
> +    date =3D elt['cve']['lastModified']
> +    try:
> +        accessVector =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssD=
ata']['accessVector']
> +        cvssv2 =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssData'][=
'baseScore']
> +    except KeyError:
> +        cvssv2 =3D 0.0
> +    try:
> +        accessVector =3D accessVector or elt['impact']['baseMetricV3']['=
cvssV3']['attackVector']
> +        cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> +    except KeyError:
> +        accessVector =3D accessVector or "UNKNOWN"
> +        cvssv3 =3D 0.0
> +
> +    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
> +                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).cl=
ose()
> +
> +    try:
> +        configurations =3D elt['cve']['configurations'][0]['nodes']
> +        for config in configurations:
> +            parse_node_and_insert(conn, config, cveId)
> +    except KeyError:
> +        bb.debug(2, "Entry without a configuration")
> +
> +do_fetch[nostamp] =3D "1"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179272): https://lists.openembedded.org/g/openembedde=
d-core/message/179272
> Mute This Topic: https://lists.openembedded.org/mt/97925018/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

