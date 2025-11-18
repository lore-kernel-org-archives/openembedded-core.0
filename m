Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D4FCEDD8A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 13:46:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12778.1763473555703106099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 05:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=wq+ZD+d8;
 spf=pass (domain: est.tech, ip: 52.101.69.53, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpvkrzomWCSIVQ16O7hgmeCLnpiPt/SRipOr7uuRQXGEc6rinZBjO8miB9eoaWNT7lkJkc9/q9JzzjqNHgHjHtoq0BTQY3xNIadeqn3LI//65qtIBmXNG3Pi3GlHGnLl31gmcPJoDC2Iy2pPHhg6GksDqMRi14NppnN4SX84kadkdf7ujaBaS8YqDnXfulEGxIUhqtrKPs/4CODJ/wPjDWo80p/lgrOgsbR8fkUIcd5lPAcIKWyw88j/y4OnoVU03oTfv9gjglL6iUHb+0sdzZ/Hgg3+D+EeLv5pmnyLfDJrQTw25lvyDJjsf4la/QWv09qdiRg78/M0sLkOUZEKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76pTI6arTKUr6/eb3pF1Uc43Hoz8kGle8T1gsfaSp3k=;
 b=ghqFOeqNZ/7tP+IVyvsbHOzR1GyfT0gHtSqEU6yoQB5HVQvXyFp7gVhvYUO8OiFMGuEEpwVvAJF907ALd6U+uUtA1AU6aApmU3JyAFRL28x1PvpVEIxlqZOZPSivPSPqn7cFKBp0jAipjbKcJmZ7u3CaQFaEMMeiEORZ5kBKjjeYGfg5wuiLgPTD3GbAvmz4wlVeuCIvAGQ7tiYSIg2iwYh6XR2RKBuz1yhOq2FyWVGMT32E65UKyoKTLEGwyLrd5OsLyHmcsk8el2qQEI1/2WZ2M/kSVv2rJD4TpFIr4COgdsIkL/4uhf6bilRtCHyDLw6AJBBymLyfLa+pM1j5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76pTI6arTKUr6/eb3pF1Uc43Hoz8kGle8T1gsfaSp3k=;
 b=wq+ZD+d8LsQTsvERKlSIxYqZIQ5abol82OrIpioAV6Y6g3mJT9MZ35nNrdz+hK+tuMeLlmGW8urd/5Nqq8bbhu7fzMrP0aui7ZIh8uA7KpJR47T2Kwy0ulizC8A+NSFItSSbZe9Ie7UWfiszrIB9QSx0sAfPFsAujIv1uWe+r+X3sVdxgpc7m0MxVeS9xZI1rKQDnpkiuoNRCAy8hLjp6IsjwnvWI8ZBhLoykADAYRILoEWm68ZacTduaxW/jhnXYVcFqWKue4LTkBa8VAqs+VC4QCXWH3NGejizmyYZQGEsfiUOgDyNCTy64dWiogmW7vg6rw4Ajn6xMmz57CEk6Q==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3176.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 13:45:52 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 13:45:52 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core] [PATCH] libcheck: add ptest support
Thread-Topic: [OE-core] [PATCH] libcheck: add ptest support
Thread-Index: AQHcVQfZLw21Uwsy+0qUaanE9ezdNLT4XqWAgAAaSAg=
Date: Tue, 18 Nov 2025 13:45:52 +0000
Message-ID: 
 <GV2P189MB3005FFFE197D87EC66A8291BFED6A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251114014145.23826-1-pratik.farkase@est.tech>
 <3B3B7E23-74C0-4DA5-8320-65451871C09E@arm.com>
In-Reply-To: <3B3B7E23-74C0-4DA5-8320-65451871C09E@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|VI0P189MB3176:EE_
x-ms-office365-filtering-correlation-id: ba333e6f-278d-4dbb-7a28-08de26a8ca69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?E88FONxvUhwNSikHQfPTYj+hViCF1gSxWxKaolXw5fkX9TAc0Aw7CurR?=
 =?Windows-1252?Q?fHd2Ghr2UeDd6sDXnLbyhg7nBocKINXVrZXsc8K73G5ofECbzbBGNz6p?=
 =?Windows-1252?Q?ZSYCqKWXOz1TBSb/flcoLUi4weuVR++kWjf9Az+qx7RxIVhUS6y9Y/cF?=
 =?Windows-1252?Q?G4YcTBXDNkpkp+7glGLXRczWVzByvMYvVPelez3da9a4q23Ng6yGUHsf?=
 =?Windows-1252?Q?IuDeA7GmX+hTSuoTe0RxYhT/sE3j2Ry/OVt7vSZ89wJXI4V3luHMp8sR?=
 =?Windows-1252?Q?WxJKg67yk8RTH2OD+BSTQKdlQ9MiRL4A5QSZMwDqPR2YwiPamx07gyuc?=
 =?Windows-1252?Q?oUxVt7F2BKkEiyDzBEFgfD0lJIifmfYSxN7FL66zjMjZbJ6U1h1IeKYv?=
 =?Windows-1252?Q?2Ix4Qv6ewOX7z4BHkTaPu0i1Pwa6qbSAWaCXmfxC0xdv1aoYNTqrObGK?=
 =?Windows-1252?Q?G9sHrDCy9ixoAJ6jIrwhhHYIX8zMM7hFzkCEo5yOzVtbVvyV7WG744Zx?=
 =?Windows-1252?Q?t7COots7l/7mqU+PDLhD1beUSbAGXj9PcEkkp5khxIybRtnRjlOnu+5T?=
 =?Windows-1252?Q?HvTsu7tueKyGZfOAAETz6MV4dcFcteVgGzIShj3smwj5DQtij5ScYAP3?=
 =?Windows-1252?Q?0d1CW2/etRyi00ZbybgyMSMza+fa03o6upkQhylG8jhC2Cc1JdFXoTTg?=
 =?Windows-1252?Q?dCwpdtMT3b2mc4XvdVNRCImajgM2qub5W3JagmDOiExjaPGJSfwBMcWe?=
 =?Windows-1252?Q?TjWmT9lWteaE2przCJIo1YpI1or9oZnn//uJDJmAwpit7O19msChxPdu?=
 =?Windows-1252?Q?sjmXguDWxgBRWydYxH4cYQuF9OsS9Gu0VUGfBambZr85WfOdaCunm+xs?=
 =?Windows-1252?Q?RK7GSPUGaolxLDn3ueYAsxa15cuoFtDjIs8LZjihNlHWauekq7GD9cVr?=
 =?Windows-1252?Q?xT4ld2dvzEQ2MY/puWtnUlhTMeWIHmZQSNtOrzZER4J9aMe8eyvt96ga?=
 =?Windows-1252?Q?UnHg1/Zg9m80XW4I03ecC5n+LVrjxLhOE/Wymf/J+clSsXJnXBq/wDsl?=
 =?Windows-1252?Q?umyE101kNcLNKTD9ag3xNJdSnDGqxSYDVF+qcXuBw8Bs2B56KoXoyzXU?=
 =?Windows-1252?Q?3FHnFy6HZYCRAEBI0OCOZxcd4504aU/Gca8nhAu9ggMPxURquj/F1sWF?=
 =?Windows-1252?Q?HSN3iKiFbywqblxYejkD5NYS34CVpAbQcmCHPYYSizXJu3fAZjGdBCTc?=
 =?Windows-1252?Q?DINXwakebkq6D83DM0CZ9gZRW+lf2hzXYCCSvTWZXPUl91a6ZW90vzDW?=
 =?Windows-1252?Q?KE0845dEQ+S/SyYHC+9IA37bFPVyYl0fjdCZqR/4K21raRXNxj2uPZ/6?=
 =?Windows-1252?Q?+TEGbwBLNyhepz7i/dwu7dcyL9LmGBuevFs68KQ4dJb1X+T32Qtysquq?=
 =?Windows-1252?Q?Tm7tZPe1gL6CCcNs28vX0arU21WZ9VdIL788ul05da4Rn/H2gMZTnJDL?=
 =?Windows-1252?Q?MRsEl5EOeuk1Zj5uZiM6XxbKZlbx2Titen4MRo2Tr05oneo+PRHBQqui?=
 =?Windows-1252?Q?4ZXMVNEd4CzRAjrqNkyAbapPVKxhy8YdUcOSE+dGIgBVvQ4y2cndoI4I?=
 =?Windows-1252?Q?PAf3Hi2KzBTRzbN/Ifg2nA4K?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?8jtwYLw1zgIYQ1WMSs5bbCL1X6bpIi6xDhKNoyvRJaHBvFsam0L5h7AH?=
 =?Windows-1252?Q?EjUerhMDTKM5O0zRIXL2gvZl5g+CQbBwb7Zd3rHfTCbPTutOj06GMBwu?=
 =?Windows-1252?Q?2/xahAyMHFdYx4P9M7Z7vXO6//zPXiKWh7NMr5TiEOk1hm6C7elcbvQl?=
 =?Windows-1252?Q?9KeZp2X1b3IOg09hEybk3xPVoF8fwhtChzrF++ZMuZ21ChAFMVTbJqsQ?=
 =?Windows-1252?Q?nN3JltGC9hPq3OQK97zhxqqcTIMOXR0sArDbLvzBpc/UfHOwsoRHRv+Z?=
 =?Windows-1252?Q?bjv7WAVI5IDrtsDTMU8b4poyL+lSDxMSCBWKnTfmUjNQ8hv2E2OYIpB9?=
 =?Windows-1252?Q?5XJJU6atH11+YoH+CWN7mCHFDDBvzLsmDZ/3ccpeN0h0xGzwYAqyqUwg?=
 =?Windows-1252?Q?S59ee1Ct2BVYaBqGqKHvXVu5APbU9ikpBmwwhmijHqw0HOWCjq9ShU9X?=
 =?Windows-1252?Q?5//vR8D4le3q5RFKAUaKpqLmq1mT6OYQI8APtYcAZz8BALjPcecO/uUj?=
 =?Windows-1252?Q?PJqL4X0BdaPJ1zl+66XkY0oaLb03rI8QajEK85elBHK2fYoY7+D4svT9?=
 =?Windows-1252?Q?O1YpKRIabTyHqDJkA09I2dkfLbEl3YNafRTxuoBo84R0zG4P3QnJbc6C?=
 =?Windows-1252?Q?trYovhRQiporkxg4NLGINgpiEaCHBo8XaoLH43+g75UsYlsDoZzAZeuQ?=
 =?Windows-1252?Q?5ujAK5Pdk1NtJroubXCER2m5tcNebpLInA4ekYSck4WGocALpwSOyPLI?=
 =?Windows-1252?Q?8RjA7imKN5r8gRTt6KP3x7ZiqNtyPDbjFkPu2Kd5n73eayGNEx+Of8Pf?=
 =?Windows-1252?Q?DjDhKs2dBlN3VRWBbiP8jZum5LysyS5QehogW+28TrMUp6mG+kkVSAnB?=
 =?Windows-1252?Q?Usok61TnCchtHpQc0/VOPn6TPkkHWyOjG50VXhO7wc8eddr/yVXH97Ll?=
 =?Windows-1252?Q?iaWyXRWZVY+uDlOjSdwYM0tRTlJjONW2khkWPSpVWlsrx0WrcuhYumVc?=
 =?Windows-1252?Q?o4IeWMMCLOBCvQzJWpygTuirVuUItVRl9LYxxiuYNg5ZtTLJwm3XHsE6?=
 =?Windows-1252?Q?GKlZ83xZviLygGiycWvlBHC5Bkz32yEoCnE7EaVZ5+RRm2sneOV8OBt7?=
 =?Windows-1252?Q?Jw0MYG/5UJXY0ZKHnaz53ZPQ96/vqeqLi4+4vd+TFFBL6K4qfaI/jq9K?=
 =?Windows-1252?Q?8M5oAbBJ3Zv+xZGS+Ox/SiK12PkVBvMJoH56aAL8Y6xmpyGtZiVaP6E0?=
 =?Windows-1252?Q?/y/BgdWYHrDy5rX4+KmgDr5GHr1JIzvtQydnKVj3VYbWdElPjTb84weY?=
 =?Windows-1252?Q?2A7nPlK8tWhJT2557ll/tOIkL/SsXbed4jf9oA12gjy3/r3mUD9/4hbS?=
 =?Windows-1252?Q?aCbmHv9qKkbOn53Atv4/YD5ORxnQkuXY/vrQjHeqYia5xsSxmLptz3d3?=
 =?Windows-1252?Q?YjvyYT3GvImrTrgm4FXji+9F+4NE57TTZ8n6eIoiNI3+wqPMbg3oNtXq?=
 =?Windows-1252?Q?paAvJpvdA7VQCDS49i1CssSJo2TNLTPvhrIcwE1dsImLI7pfPL4hCL2+?=
 =?Windows-1252?Q?rEyzr7YC6tPqVS+qUgaI6awNVasN/MzLOYS7F3T3HBtQGwXkWiKNR8WG?=
 =?Windows-1252?Q?WadTg0bmXHE6r7mYlyuFjRBeTwn8Qii4NeLhsUcl/PCqddEHJXCa+WTw?=
 =?Windows-1252?Q?f0RaMn4LcFeig5RkTOAunSNLKKyhVLFI?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba333e6f-278d-4dbb-7a28-08de26a8ca69
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:45:52.5025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxlkuKbdxEBqcznIYnfaSdsMR7K0j3GyDeAHTeysDALriyRzmRi/8TCk5uVxy9WzDXAimIO/obLde05DrBAWIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 13:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226527

Hi Ross,=0A=
=0A=
Thank you for the detailed review and feedback!=0A=
=0A=
I've addressed all your comments in v2:=0A=
=0A=
1. Merged the duplicate test loops into a single loop=0A=
2. Removed || true from install commands  =0A=
3. Hardcoded the list of helper binaries to install instead of dynamic dete=
ction=0A=
4. Simplified shell script installation using *.sh glob=0A=
5. Used ${TARGET_DBGSRC_DIR} instead of hardcoded /usr/src/debug path=0A=
6. Removed redundant RDEPENDS (bash and libcheck)=0A=
=0A=
All 9 tests continue to pass on qemux86-64.=0A=
=0A=
v2 patch is attached/sent separately.=0A=
=0A=
Thanks again for the review!=0A=
=0A=
Best Regards,=0A=
Pratik=0A=
=0A=
=0A=
________________________________________=0A=
From: Ross Burton <Ross.Burton@arm.com>=0A=
Sent: Tuesday, November 18, 2025 1:10 PM=0A=
To: Pratik Farkase=0A=
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com=
=0A=
Subject: Re: [OE-core] [PATCH] libcheck: add ptest support=0A=
=0A=
Hi Pratik,=0A=
=0A=
Thanks for adding a new test case.  Some comments:=0A=
=0A=
> On 14 Nov 2025, at 01:41, Pratik Farkase via lists.openembedded.org <prat=
ik.farkase=3Dest.tech@lists.openembedded.org> wrote:=0A=
> +for test in check_check_export check_check; do=0A=
> +    if [ -x ./$test ]; then=0A=
> +        ./$test > /dev/null 2>&1=0A=
> +        if [ $? -eq 0 ]; then=0A=
> +            echo "PASS: $test"=0A=
> +        else=0A=
> +            echo "FAIL: $test"=0A=
> +        fi=0A=
> +    else=0A=
> +        echo "SKIP: $test"=0A=
> +    fi=0A=
> +done=0A=
> +=0A=
> +for test in test_output.sh test_check_nofork.sh test_check_nofork_teardo=
wn.sh \=0A=
> +            test_xml_output.sh test_log_output.sh test_set_max_msg_size.=
sh \=0A=
> +            test_tap_output.sh; do=0A=
> +    if [ -x ./$test ]; then=0A=
> +        ./$test > /dev/null 2>&1=0A=
> +        if [ $? -eq 0 ]; then=0A=
> +            echo "PASS: $test"=0A=
> +        else=0A=
> +            echo "FAIL: $test"=0A=
> +        fi=0A=
> +    else=0A=
> +        echo "SKIP: $test"=0A=
> +    fi=0A=
> +done=0A=
=0A=
This looks like the same loop, twice. Why not merge them?=0A=
=0A=
> +    for binary in ${B}/tests/*; do=0A=
> +        if [ -f "$binary" ] && [ -x "$binary" ]; then=0A=
> +            case "$binary" in=0A=
> +                *.sh) ;;=0A=
> +                *) install -m 0755 "$binary" ${D}${PTEST_PATH}/tests/ ||=
 true ;;=0A=
=0A=
Don=92t ||true, if it fails we want this to fail.=0A=
=0A=
Also considering the lists of tests is hardcoded in run-ptest _and_ upstrea=
m hasn=92t been changed in four years, it might be easier to just hardcode =
the list of binaries that we install instead of playing games trying to ide=
ntify the right output.=0A=
=0A=
> +            esac=0A=
> +        fi=0A=
> +    done=0A=
> +=0A=
> +    for script in test_output.sh test_check_nofork.sh test_check_nofork_=
teardown.sh \=0A=
> +                  test_xml_output.sh test_log_output.sh test_set_max_msg=
_size.sh \=0A=
> +                  test_tap_output.sh; do=0A=
> +        install -m 0755 ${S}/tests/$script ${D}${PTEST_PATH}/tests/=0A=
> +    done=0A=
=0A=
This is just test/*.sh, right?=0A=
=0A=
> +    install -m 0755 ${S}/tests/test_output_strings ${D}${PTEST_PATH}/tes=
ts/=0A=
> +=0A=
> +    if [ -f ${B}/tests/test_vars ]; then=0A=
> +        install -m 0644 ${B}/tests/test_vars ${D}${PTEST_PATH}/tests/=0A=
> +        sed -i \=0A=
> +            -e 's|if \[ x"[^"]*" !=3D x"\." \];|if \[ x"/usr/src/debug/l=
ibcheck/0.15.2/tests" !=3D x"." \];|g' \=0A=
> +            -e 's|SRCDIR=3D"[^"]*"|SRCDIR=3D"/usr/src/debug/libcheck/0.1=
5.2/tests/"|g' \=0A=
> +            ${D}${PTEST_PATH}/tests/test_vars=0A=
=0A=
Hard-coded paths that will break on upgrade.  ${TARGET_DBGSRC_DIR} is the v=
ariable you want.=0A=
=0A=
> +RDEPENDS:${PN}-ptest +=3D "bash libcheck"=0A=
=0A=
You can remove this: I don=92t see any scripts that use bash, and the depen=
dency on libcheck will be generated automatically.=0A=
=0A=
Thanks,=0A=
Ross=0A=

