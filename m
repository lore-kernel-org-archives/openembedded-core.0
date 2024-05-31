Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28208C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 05:01:03 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.92])
 by mx.groups.io with SMTP id smtpd.web10.4536.1717131658359747809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 22:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=AG+SNf8c;
 spf=pass (domain: navimatix.de, ip: 40.107.104.92, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWmsAUV98JVJidfkh+BdSSmXzoSUQyVYFDU0QxKEA2yZJ00LjIKf1M122LaCrHy8xAybbkwHwYnnL9m4ifxKeG/qmx4bqvHeAS80vaUOeEsLIOoTlxN5GTgtFK/eq223ENHS4RHbQ4GwR4vpdutNQM6Xmc7VROnb0xo35icZiCiqRG/irzCqoT7YqySOsvxFxMCJDDV5xskSzJtJVF6uUTzqMxMZfOBV9KMXhaRvZgIofBFD7wt8KD4gFDQ0qvOPDdb9WO5Db4XPlY7Mq9PXlY0vaf3naNMXoKCEGEvFuHAF7gGxCthnAnN+HUsK5BmcM3nAOc5edb2Ac84OiYcgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdqUt8/23hgcljjc9kUJPYp+j1CkQjB8ekjzbHgseWs=;
 b=K65aGvfKoep8MP5UH0U1i2O3IAmgTtejDa/i5Axub9WADJblma98tS3saWHCoyCqim93oqLwKaCjQWKB3hGHy7Qp6unkxijA8eTaC38zlUFzJDp5n3L7E02jc3EmZCSoQVwjw5Psn7PwlwMHkbjNnZpqFYc3GQKTAKiLpjIiYbv7z2TZpbpozM/bBSeMcPH2w6BFkJB8zNGlryRoJnKz+5XzDAV4OEpI/5Ndh3vNw+64GLe55woaGs7IFjRhdJXkTwcEijJVttmOrZt/jlBX/oJsGUZIunBDjtAy6JQ+UCn+3SFAh4bkfkZvT90Vhz5m6tHvcFOdCtw6gt3JuCdzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdqUt8/23hgcljjc9kUJPYp+j1CkQjB8ekjzbHgseWs=;
 b=AG+SNf8cU1W2w3AknpJwCZJi0qSmwTL5L+x/JHrWHU+g+te+6g4oAL6H0MwXWjKoCgmNFN8cHG74Y6gsj9Edl4m47qQbvEeV2TuDvdu/U+AYFrNlIkXu/mz0l7aF8oK0zAxuiV+xZk09BbZkZqO41l5hfSfFFECzFb5UBMcOBts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB9398.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4c9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 05:00:55 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:00:54 +0000
Date: Fri, 31 May 2024 07:00:52 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: faganronan@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] New to the group
Message-ID: <fwj45a5fopseifnvazxbdxgpick3qrs64ld5m5uwvu74h2kvbi@ewlchlza7idf>
References: <FUsD.1716494294899619486.PFwn@lists.openembedded.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="derg6guhdckcbs4n"
Content-Disposition: inline
In-Reply-To: <FUsD.1716494294899619486.PFwn@lists.openembedded.org>
X-ClientProxiedBy: FR0P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::11) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: f51af08b-d648-4f37-4271-08dc812ea6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?cm8DCJM9vKYxRRmDS8ccfIktX/OKdlMs7P6yFt/6w9GDINERLvoorgwebn?=
 =?iso-8859-1?Q?VgDNkSTcv4S4rhlmgJdwcu+9aJdxjS+pG1wB679SAb7kCeSsxSWeqE8cz1?=
 =?iso-8859-1?Q?GNLedo2j5P936EuikxBlw6MDmjMfnv2M8gKhO3g0lRKVMWvPrO3P/WM3D+?=
 =?iso-8859-1?Q?zhBI+siDmDooYulytjmsBeXoI/njF+EI4IXdf9FBrs9UNUNzQGmoYyZLjt?=
 =?iso-8859-1?Q?25QYCypHMaz9ZOiw0Ma9z/s/a7J1w6pSw/ShM/kTW48ZvsDQ38yAdB7jD3?=
 =?iso-8859-1?Q?76Cgmu0gzbPPbKVFhUradPLT+KKiKd4h7XbCCEzP7t8ULBaqznY+R+oxpX?=
 =?iso-8859-1?Q?2KzN8qMWayT/M5Uy0iFfpVy0QCuu3Py5RZIHkZiS/ZdFqlzwOKIj5KFmnC?=
 =?iso-8859-1?Q?8m4lzpn+yN0a2YyFfOjM0yoduGmktHovSiX3OIQTt9tu9WlXjW8cZCxvpz?=
 =?iso-8859-1?Q?vWx8Dv2lQWPXUJBVLY+1VfFWUFplK6hy8paKA2fb2mFNZnFtHnjFTb1xyB?=
 =?iso-8859-1?Q?Yw1uT771EczNqaiMnZyI8rltKeo4JF2RcFn4HOfYDXI9ng/uxGkOkh+zSu?=
 =?iso-8859-1?Q?7uvFg6pKhTsYpK0v83R/fDFqllWdcMf+5e6M67KQvqoOdWzf6Rhrr7cySG?=
 =?iso-8859-1?Q?cf+bVtpBr8MW26XFzqufrEXDFncoTJPDsXGPLHRZrpWN/oPjhyAw3+ITk1?=
 =?iso-8859-1?Q?5rXs2Y6jJPemap2jpWold+pR3nhrb8V5Dlx90MHi/iVWNvJkTmy1ZEtgzw?=
 =?iso-8859-1?Q?BTvewvlouSAUhFWb6PHScFac0jrdrX4e7FgCHfhjSCUhD/skpJs+wKLZX5?=
 =?iso-8859-1?Q?lmzyTwlvr0MOa8K0u/XTwX8ZVZ1d1/CJ493FZ8KVJR7V0CVdjL7nEJI9hF?=
 =?iso-8859-1?Q?+7l0t2iblKgodPwecBtRN5IrvUBOplyuc7ou1niEFIlxc3EfB9jsdX6oAh?=
 =?iso-8859-1?Q?6lr54pu3rOTEea8mpBnJH8QJ1K2Eb5W/A6GCrskE7nFSefx+ptPsqZ371M?=
 =?iso-8859-1?Q?sdqKeM4JuVJYbErT4iaxRP+3rGrCl8mwOSwZtBs0MM7vzLIs3yoLCa1H5D?=
 =?iso-8859-1?Q?BsuosiVz+L2Qba23R8od10F1+JNlZmPZypbrYVCm4SNPgiQQIAaCBJc4Xd?=
 =?iso-8859-1?Q?cpuWI3+HQmYYpSfHoHMa88E4hZZpg93b1SgztOUzt0Vj/zrTc8R75Z9idc?=
 =?iso-8859-1?Q?MenK8aN9kV1B9lQOgR+Yy35LGSkzwc8I2wUt7OTwWXwtCbg8DIn2I6JIG4?=
 =?iso-8859-1?Q?DG06/tVlrgxtpCUsFL3PcT1kLUcVGRPFPP6chfLQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?8JNSPV0GBLjOPlHd4ZyRzbeAUUwOJrmbE5PMbvBOKYFOA6BtD2nQPsFSrw?=
 =?iso-8859-1?Q?lCPxnoUyxFreV7NoSTdIacaX46lUfAGxm0ObL64Q1xZMo9yS852+P5/3ZL?=
 =?iso-8859-1?Q?astkgCvLRwuY7aX9m9yD4rn165u/pTnap8p/vQ/CPLvdTxMmG9EhfUasD8?=
 =?iso-8859-1?Q?pZYLiSDE3HVDVRWsyeVZs5wCjX/WkI6nHKqCPvqZSFnsKfMenKIJ86wWOW?=
 =?iso-8859-1?Q?Me/dJI5Lfm8H+lGQOe/Phz/sJ+oSsGv7QpbcZF+lL3XmdkFgEC9J0Qcv6O?=
 =?iso-8859-1?Q?8Am8yV7VvucQQQTz4I/8tPa5cNT0c0oKT254uXjsxDgAtDw3bR6L4D12vj?=
 =?iso-8859-1?Q?U2OzYJ0akXmCkIRFkYs7tT6gS6guetrIRnWSeufhEHnBdsR3sgBMW+AEjB?=
 =?iso-8859-1?Q?SxELu6UPFC4Qg1p07lNnRkLnnwUYUVnpgs6e99AbzMlPpLkLc1i76k17Ut?=
 =?iso-8859-1?Q?drAQoRT2c6mjqhVNF8rFoAjqm45kBZVWS6acg4+ctcFS6Mph7LWKkbrujz?=
 =?iso-8859-1?Q?zJqxrMrFOPr+fNAI6vjUsbM1ECJZ9pqu4bVanf6mPVBTOn0Xp15RPcpr2x?=
 =?iso-8859-1?Q?gRFuaMwGgWcsuulhvnOz0Y8SWvaOePzjVEuMSw2EZQz62ssOxKoNzponOh?=
 =?iso-8859-1?Q?RzGFbbEFLA+SfORqtvgr0RwYe+/cnTbVO1E8bTWYf5GeLm1NRZ/QXn1onD?=
 =?iso-8859-1?Q?D5XPfUEZMhoAdx9YjTrbW0NM+3Tbrq6MGd/jgJtb1cKyYiLZ3WGjCpyR56?=
 =?iso-8859-1?Q?2Fjg8kzV5HMLLgxvFPjKkSJnVIl1neHW9wrk6qSlIHWxhgRf3eMUjBadiV?=
 =?iso-8859-1?Q?J/pyyKFmyGkemxTGSNYqZhZVqBFFhigkq7Jb63fFCMnv+ZU4wVOKEIUn62?=
 =?iso-8859-1?Q?kaMn6snD/oCngsfk8J5ObL548KF0PWAEWfmYr7HE0Gusn7cSXwcypKbQkP?=
 =?iso-8859-1?Q?K4YYy3D/0RdFuzMtftqFGzVfgBTy2ew6zhj1PQdoCO/sc/1KmHYC3Tg9/d?=
 =?iso-8859-1?Q?lUoyi5P3hIoPjvbYu58puWoXJ55IMr91Sq393gfrRN4bJVpIIv3K8kgkQU?=
 =?iso-8859-1?Q?3hsA4fjqvWpUZI2LBGRfZcM1s2L4/7Rx1f/4tuOhMGY8o6uOgDVMq/8YvW?=
 =?iso-8859-1?Q?aJh2jVuJz2L5eYsxOaiK8IuNt285KD+TEUu6HMdq+qTTknU3YPNMM5ppHt?=
 =?iso-8859-1?Q?rF/XAEoFveDcV1vKb82mKtz3CcG9iMTYXy0VRSiRndDwcJBVwVzIbGaT/0?=
 =?iso-8859-1?Q?zAGXaM0Jtw2GN+KmQ3/rY9f9whDj4whucutKKPp1gG+qzhXaAp90CqVypY?=
 =?iso-8859-1?Q?+ZTQzLmRP/HiwPj5xC1iX1BwiOmiKvyeIfSvFiHlYEQLAEiPgfwxFAlkDC?=
 =?iso-8859-1?Q?SwEhpkJoP7szIPVubMHJNfffcvE7AHqefoHxbdEMR7HA+fjhNhNMKSgtrQ?=
 =?iso-8859-1?Q?3QOa/KkNvTeYxSAUuuMHRCfmnyXm+DIyVwZ491ITkKwo7qmYrQf7oTzCmq?=
 =?iso-8859-1?Q?WEeOkgaJkhuFoO/dKBI7WD/hbIdwMYSvFajAgUt5R+FGQ6ajhsEeGHU/Uc?=
 =?iso-8859-1?Q?5NTmNqyV8IlSpUlclHfAiqigpMeepvqpSgd/dSe9IH7zHD1oyT9CwXkJmX?=
 =?iso-8859-1?Q?83KFfHd16NuR7oLSscotKBSpVFcZojYTacyEQPSu0IKiUEH7MYqfFnvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f51af08b-d648-4f37-4271-08dc812ea6c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:00:54.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjNO1Do6/GaXFfAff0IM364TfxBuA2MUvXvYU+8AsBk9qkuKOu/iNKBoSA4xfa7fjL5Tp683KyC9yPlwh/eQUIkbaX55+S0TZT+acfJxAyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB9398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 05:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200053

--derg6guhdckcbs4n
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] New to the group
MIME-Version: 1.0

faganronan via lists.openembedded.org schrieb am Do 23. Mai, 12:58 (GMT):
> I'm brand new to the group, apologies if this is not the right spot. I've
> been working a lot with SBOMs for embedded devices lately and been playing
> around with the recipes for spdx and cve with limited success. The SPDX on
> even a minimal image creates 500ish SPDX files and then it has to be with
> the CPE data. I've had some good success with CycloneDX. Anyone else
> running in to this?

Yes, I'm using CycloneDX with DependencyTrack, and wrote a converter of spdx
to CycloneDX. The script also handles the upload to DependencyTrack, which
is not that easy, because you have to wait for the end of the processing,
before going on.

A better approach would we a cyclonedx class, and I plan to create one, but
didn't found the time to do.

Here is the current version of the script:

```
#!/bin/sh

# There will never again be support for SPDX by DependencyTrack
# https://github.com/DependencyTrack/dependency-track/issues/1053

set -e -u -C

no_upload=3Dfalse
recipe_filter=3D\*
skip_sbom=3Dfalse
skip_vex=3Dfalse

while test $# -gt 0
do
    case "$1" in
    --no-upload) no_upload=3Dtrue;;
    --skip-sbom) skip_sbom=3Dtrue;;
    --skip-vex) skip_vex=3Dtrue;;
    --recipe-filter)
        shift
        recipe_filter=3D${1:?Argument for --recipe-filter missing}
        ;;
    *) break;;
    esac

    shift
done

if ! $no_upload && test -z "${DT_API_KEY:-}"
then
    echo 'Environment variable DT_API_KEY not set' >&2
    exit 1
fi

if test $# -ne 4
then
    echo "Usage: $0 [OPTIONS] HOST_URL PROJECT_NAME SPDX_TAR_ZST PROJECT_VE=
RSION" >&2
    echo >&2
    echo 'OPTIONS:' >&2
    echo '    --no-upload                do not upload, but print to stdout=
' >&2
    echo '    --recipe-filter FILTER     only process recipes matched by wi=
ldcard FILTER' >&2
    echo '    --skip-sbom                do not generate the SBOM' >&2
    echo '    --skip-vex                 do not generate the VEX' >&2
    exit 1
fi

dt_host_url=3D$1
dt_project=3D$2
spdx_tar=3D$3
dt_version=3D$4

api_req() (
    path=3D${1:?API path}
    shift

    if out=3D$(curl --no-progress-meter --fail-with-body -H "X-Api-Key: $DT=
_API_KEY" \
        "$@" "$dt_host_url/api/v1$path")
    then
        printf '%s' "$out"
    else
        rc=3D$?
        echo "curl $dt_host_url/api/v1$path failed with exit code $rc: $out=
" >&2
        return $rc
    fi
)

api_req_prj() {
    api_req "$@" -F "projectName=3D$dt_project" -F "projectVersion=3D$dt_ve=
rsion"
}

spdx_to_cydx_sbom() {
    # https://github.com/CycloneDX/specification/blob/1.5/schema/bom-1.5.sc=
hema.json
    # https://docs.dependencytrack.org/usage/cicd/

    tar -x -f "$spdx_tar" --to-stdout --wildcards recipe-"$recipe_filter".s=
pdx.json | \
        jq --slurp 'map(.packages) |flatten
        |map(select(.name |startswith("packagegroup-") |not)) | {
            bomFormat: "CycloneDX",
            specVersion: "1.5",
            serialNumber: "urn:uuid:'"$(uuidgen)"'",
            version: 1,

            metadata: {
                timestamp: "'"$(date --iso-8601=3Dseconds)"'",
                component: {
                    name: "'"$dt_project"'",
                    version: "'"$dt_version"'",
                    type: "operating-system",
                },
            },

            components: map({
                type: "application",
                name,
                "bom-ref": .name,
                supplier: { name: .supplier },
                version: .versionInfo,
                description,
                licenses: [{
                    expression: .licenseDeclared,
                }],
                externalReferences: ([
                    { type: "vcs", url: .downloadLocation },
                    { type: "website", url: .homepage }
                ] |map(select(.url !=3D null and .url !=3D "NOASSERTION"))),
            } + (
                .externalRefs[0].referenceLocator
                | if . !=3D null then { cpe: . } else { } end
            )),
        }'
}

spdx_to_cydx_vex() {
    # https://github.com/CycloneDX/bom-examples/blob/master/VEX/vex.json

    tar -x -f "$spdx_tar" --to-stdout --wildcards recipe-"$recipe_filter".s=
pdx.json | \
        jq --slurp 'map(.packages) |flatten
        |map(select(.name |startswith("packagegroup-") |not))
        |map(select(.sourceInfo !=3D null)) | {
            bomFormat: "CycloneDX",
            specVersion: "1.5",
            serialNumber: "urn:uuid:'"$(uuidgen)"'",
            version: 1,
            metadata: {
                timestamp: "'"$(date --iso-8601=3Dseconds)"'",
                component: {
                    name: "'"$dt_project"'",
                    version: "'"$dt_version"'",
                    type: "operating-system",
                    "bom-ref": "project",
                },
            },

            vulnerabilities: map(. as { name: $name, versionInfo: $version }
            | .sourceInfo |match("CVE-\\S+"; "g") | .string
            | {
                id: .,
                source : { name: "NVD", url: "https://nvd.nist.gov/" },
                affects: [{
                    ref: "project",
                }],
                analysis: {
                    state: "resolved",
                    detail: ("Fixed by patch applied by Yocto recipe " + $n=
ame + " " + $version),
                },
            }),
        }'
}

wait4process() (
    kind=3D$1
    token=3D$2

    msg=3D"Waiting for $kind getting processed..."

    while true
    do
        out=3D$(api_req "/bom/token/$token")

        case "$out" in
        '{"processing":false}')
            break
            ;;

        '{"processing":true}')
            printf '%s' "$msg"
            msg=3D.
            sleep 2
            ;;

        *)
            echo "Unexpected return from /bom/token check: $out" >&2
            exit 1
            ;;
        esac
    done

    echo 'done.'
)

if ! $skip_sbom
then
    if $no_upload
    then
        spdx_to_cydx_sbom
    else
        out=3D$(spdx_to_cydx_sbom | api_req_prj '/bom' -F 'autoCreate=3Dtru=
e' -F 'bom=3D@-')

        echo "SBOM upload response: $out"
        bom_token=3D$(echo "$out" | jq --raw-output .token)
    fi
fi

if ! $skip_vex
then
    if ! $no_upload && test -n "${bom_token:-}"
    then
        wait4process SBOM "$bom_token"
    fi

    if $no_upload
    then
        spdx_to_cydx_vex
    else
        out=3D$(spdx_to_cydx_vex | api_req_prj '/vex' -F 'vex=3D@-')
        echo "VEX upload response: $out"

        wait4process VEX "$(echo "$out" |jq --raw-output .token)"

        out=3D$(api_req "/project/lookup?name=3D$dt_project&version=3D$dt_v=
ersion")
        prj_uuid=3D$(echo "$out" |jq --raw-output .uuid)
        echo "Triggering refresh of metrics of project $prj_uuid after VEX =
upload"

        api_req "/metrics/project/$prj_uuid/refresh"

        echo "Visit $dt_host_url/projects/$prj_uuid for results"
    fi

    # TODO compare with https://autobuilder.yocto.io/pub/non-release/patchm=
etrics/cve-status-kirkstone.txt
fi
```


Regards, J=F6rg


--=20

--derg6guhdckcbs4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQ9t0e7j4oz9r0g2Z94yuDGqZL7UAUCZllZhAAKCRB4yuDGqZL7
UKfiAQCw97gN9HIlv1DeYbmQqwerA/XSOFwKzW4kCUSDc6K77QEAkOOsS0mq4m0r
8T1s/8tRoAg93UnGzJ+BY/+mjMZnYQk=
=XA7N
-----END PGP SIGNATURE-----

--derg6guhdckcbs4n--

