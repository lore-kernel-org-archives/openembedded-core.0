Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80387CA100C
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 09:37:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.73060.1756805824560490888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 02:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lyyzMWfD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Ro3C024999
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Sep 2025 09:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Snnvgoqr9SBRnynRNjDeDdoCl02IfyXgb+kFh5Q7yQ=; b=lyyzMWfDPmPoXsYa
	CHewi9Dk5OKw2gPBmtRFrHLn2CfXDkIWOYEOAZRutSkYNLJYctpE9cT3ju/ctOD5
	YRsvT+z2P4lIyhHo0c1BWCNsCgzR2s4tdLcl9x9klVL7unkaEPUMJq2QBQ7I3SBJ
	cZs146Nxm+/MGlXN3u0zu3MkeRIiMpjd2XDheHb/NXIkd7L7OMfc4RFFkunRUxRR
	gDzRrH7mCmBbUHTbbcu86WTslWcRCjl36+hoBaaQKHr/S+PsgC9VZpd3g59n6IG3
	rPYE35TiSJ0/V6i/aWG1sWceBRkRAbqStuuqWIeDTFyleZ3MJ3lxnTEyENXlhxLb
	IyzCyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuybd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:37:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3349c2c65so41607011cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805823; x=1757410623;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Snnvgoqr9SBRnynRNjDeDdoCl02IfyXgb+kFh5Q7yQ=;
        b=UtGxbggKT7ulvgM21/9Da52B0LtOnNNS4jKDNWKwjyrxt0SAhiynSXEy35zDWA9Tyo
         1Zcv59aUAhYZkkfP0HmuuxPron5py6N0Dp5gC4zNJkjgJrCs3v84CPipHzy8/QjwSOfJ
         StORdkpUJ3kSfgoCO+qWBEoLt2X56DBlsTwuEsxu2IMoqg/RIzJiU9oBdAZs5LfCwsKZ
         qsqgYfuwR90YJ5Nei7K9aGtZT21KWSYbeeSYTytuwHI6OTCamstZOUBeIeSNwr4Iofd2
         ujIwQ91VuS9Q3YfakIekWGMz1BaeqHcNmVg1joP6iKbPuIbc7epeqB7YdEKdQAfQz6Jo
         jelw==
X-Gm-Message-State: AOJu0YxtVpcbE1Fi8R0yFOcaexyC45yvauQLY7wTqkzLz6YPtnHNCIoy
	TKO7PTkrXn0ooaD+czt9yN6tt/hIJBea7euUFx660RiK/vWhezrtq1IkPumcRZUOjK6Um2dLwMe
	DioEN8Gj6JRNdPKTPF9ZYTczJd0LcXuuE7+uFTRkjpUowiQileb6DL26FuU/ekDR7NsgWxsB5HU
	q35ZWo0JU=
X-Gm-Gg: ASbGnctiKNw32XPDDofwk5LKV0GmjIN9ixJfinjIUgJXFbMvc3M3TYaSr4HBC7e1Qzo
	t3WiHntTcWTXUgH7nKzBNIF8rxSRyBPj6Y6lkYWgRas6m+O8aUC7DvLDpnDvCqDVFPCIRKy/Zdt
	0R08POvsId4BO9FTGr1kUSK3ftQLDMW6grXVE/Evz9LOAORC4Atk5DIavgaCZQVktY6UQ7Uo/hW
	FvOadb9a18ElqIZ7gHAz1Ze2zl8KVopq4mG+TG9XQyYNSMXs4neNmX0vuy+PnNqx1CpvfDxe6Ow
	wqO65m1ifPEmpnpcR2Y+i90b2meWstS4tdeTDZRo6bvmZCGor19EJOAEB1kt1W63y11BHPtPxkU
	GQN8e8jBwNDCCNQ==
X-Received: by 2002:a05:622a:592:b0:4b2:9830:197 with SMTP id d75a77b69052e-4b31da3cdadmr112073941cf.48.1756805822598;
        Tue, 02 Sep 2025 02:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0zR7V4IcoE+XR440S2+u6mwl2KQxWRZwZBHD89nEMz/BNsjUfnNVSaLTFGh+A+Bny2v/s5A==
X-Received: by 2002:a05:622a:592:b0:4b2:9830:197 with SMTP id d75a77b69052e-4b31da3cdadmr112073821cf.48.1756805822058;
        Tue, 02 Sep 2025 02:37:02 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a8fsm9151840a12.3.2025.09.02.02.37.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:37:01 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: Patchtest results for [PATCH] systemd: stop enabling non-standard
 MAC policy when using the 'pni-names' DISTRO_FEATURE
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <0101019909b62f4c-4894f4f0-86c4-4440-8379-d73df3139547-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 11:36:50 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54B88CB1-9BD3-4F7E-99F1-F048BAAF2197@oss.qualcomm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <0101019909b62f4c-4894f4f0-86c4-4440-8379-d73df3139547-000000@us-west-2.amazonses.com>
To: patchtest@automation.yoctoproject.org
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX71VxeJAeTsUy
 54rBFfJdmGTn/v8bU01GFRQ1o3CK6Jign21Sv/Ayrvb4SEFnjl+/QQ5Tk0GqXFacdbK2HETJFJR
 e8uZoeviBbzxQkBlkOWT6VCCmQAjKcEvIObwXXLl1r8D+mpQoH/mw1Ma4sfTjxWrUk+lwMk2CJg
 Bq1kO8aRVaoegmbJEyR5FAWESAqnLbWuSS5zPQks/v4guHx42sWVxnjlMSpW0TLGVaWouMg2C0w
 zaDJjrL753XotnTxFtdFTcUUwjnNwy5UHKWhn66/GrRWLzxrzumis0eQWXcbsLrTrDhGp6tk5eo
 tvE2C7zP5eDJERHF0hsVg6RaLWh8O/RaV+wuYFSBb+b56/taCoNLuXvt31NK7njBTaeRBbypVCy
 3H5rDrnq
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6babf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=OmQg1XK9loyA-OjW1fMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: KpbYZufBH0QUJS4_1H6OtQ2jXL1QbPLX
X-Proofpoint-GUID: KpbYZufBH0QUJS4_1H6OtQ2jXL1QbPLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222719



> Op 2 sep 2025, om 11:15 heeft patchtest@automation.yoctoproject.org =
het volgende geschreven:
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch =
/home/patchtest/share/mboxes/systemd-stop-enabling-non-standard-MAC-policy=
-when-using-the-pni-names-DISTRO_FEATURE.patch
>=20
> FAIL: test commit message user tags: Mbox includes one or more =
GitHub-style username tags. Ensure that any "@" symbols are stripped out =
of usernames (test_mbox.TestMbox.test_commit_message_user_tags)
>=20
> PASS: test Signed-off-by presence =
(test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence =
(test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length =
(test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list =
(test_mbox.TestMbox.test_target_mailing_list)
>=20
> SKIP: pretest pylint: No python related patches, skipping test =
(test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping =
pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target =
branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced =
(test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced =
(test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced =
(test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found =
(test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified =
recipes, skipping test =
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test =
(test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test =
(test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test =
(test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now =
(test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest =
(test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test =
(test_metadata.TestMetadata.test_summary_presence)
>=20
> ---
>=20
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted.

Yeah, ' @bb.utils.contains' is not a github username, but valid usage of =
bitbake API


> If you
> believe these results are due to an error in patchtest, please submit =
a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' =
category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


