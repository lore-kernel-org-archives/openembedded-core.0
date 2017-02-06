Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.33])
	by mail.openembedded.org (Postfix) with ESMTP id 0867E71997
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 14:43:49 +0000 (UTC)
Received: from 1cakWC-0002q4-TB by out10b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cakWC-0002s3-Uz; Mon, 06 Feb 2017 06:43:48 -0800
Received: by emcmailer; Mon, 06 Feb 2017 06:43:48 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cakWC-0002q4-TB; Mon, 06 Feb 2017 06:43:48 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0319.002; Mon, 6 Feb 2017 15:43:47 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: do_populate_cve_db: Error in executing cve-check-update
Thread-Index: AdKAeKvTFk2uIAe8QaGyP1UCfK+DfQ==
Date: Mon, 6 Feb 2017 14:43:47 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: "'mariano.lopez@intel.com'" <mariano.lopez@intel.com>
Subject: do_populate_cve_db: Error in executing cve-check-update
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
X-List-Received-Date: Mon, 06 Feb 2017 14:43:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,


Does anyone know if there is an issue with cve-check tool on master branch?=
=20

It seems that "cve-check-update -d" fails, does anyone know why?
poky/build-cve-check$ bitbake -k -c cve_check universe


WARNING: cve-check-tool-native-5.6.4-r0 do_populate_cve_db: Error in execut=
ing cve-check-update
WARNING: cve-check-tool-native-5.6.4-r0 do_populate_cve_db: Failed to updat=
e cve-check-tool database, CVEs won't be checked



do_populate_cve_db() {
    if [ "${BB_NO_NETWORK}" =3D "1" ] ; then
        bberror "BB_NO_NETWORK is set; Can't update cve-check-tool database=
, CVEs won't be checked"
        return
    fi

    # In case we don't inherit cve-check class, use default values defined =
in the class.
    cve_dir=3D"${CVE_CHECK_DB_DIR}"
    cve_file=3D"${CVE_CHECK_TMP_FILE}"

    [ -z "${cve_dir}" ] && cve_dir=3D"${DL_DIR}/CVE_CHECK"
    [ -z "${cve_file}" ] && cve_file=3D"${TMPDIR}/cve_check"

    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
    if cve-check-update -d "$cve_dir" ; then
        printf "CVE database was updated on %s UTC\n\n" "$(LANG=3DC date --=
utc +'%F %T')" > "$cve_file"
    else
        bbwarn "Error in executing cve-check-update"  <<<<<<<<<<<<<<<<<<<<<=
<<<<
        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}" -=
ne 0 ] ; then
            bbwarn "Failed to update cve-check-tool database, CVEs won't be=
 checked"    <<<<<<<<<<<<<<<<<<<<<<
        fi
    fi
}

Thanks
//Sona

