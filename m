Return-Path: <jrey@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8147EC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 20:27:38 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web10.5239.1676406453906386725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 12:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=AJwtWE9+;
 spf=pass (domain: linux.ibm.com, ip: 148.163.156.1, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EJq2VT019098
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=LOrxzDQfcbn8BMO331oqMMwJPk5hD+mEV1qyRwL1zFE=;
 b=AJwtWE9+e7EbmrEnuLVk5zQuNDIGIS76Wavy8a5nBv+7kwieFEK1Ea/cUhXgIMjFgseo
 jd0N70+Mcr4YWzP7NOHEfkzlKAu47qjaR39hk4Y1J+1IfXkCOmxlZ+Ff2XXJYTSrIdRF
 s36Tdjr8AQgYYgkc8NmdqFOMVeH85t3C2Smxi9dV/Tp/Wb+POXzOwJCFd9ke1d7U945d
 klEZWWuJkoXYN5xKDy6A+W1sAqLcXhpmOuFkuQCEo5D/vWOAFibdTC2Os7Yn1Ob8FCTQ
 mDCkbQgyPUmnAWeUOFwZRDqIHNPx6o49eelDf0ecUKFHlnmI6qiguQziCZLVCaWLQzI0 PQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrgu78q4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:33 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EIArlN024137
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3np2n7drr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:32 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31EKRVfJ35324170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:31 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 330C658067
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:31 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC5A858068
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:30 +0000 (GMT)
Received: from [9.160.26.167] (unknown [9.160.26.167])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:30 +0000 (GMT)
Message-ID: <20466372-402f-4659-fa23-e72461b6199d@linux.ibm.com>
Date: Tue, 14 Feb 2023 14:27:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Can create-spdx handle multiple components per recipe
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tawTa9CwZV2aCLSO9a47uFPKfTm7jms7
X-Proofpoint-ORIG-GUID: tawTa9CwZV2aCLSO9a47uFPKfTm7jms7
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_15,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 mlxlogscore=540 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140174
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-001b2d01.pphosted.com id 31EJq2VT019098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 20:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177174

Team,

Thanks again for continuing to improve Yocto/OE.

I have a question about the capabilities of the create-spdx.bbclass.=C2=A0=
 I=20
understand it will can an sBOM entry for each recipe.

Can create-spdx.bbclass handle multiple components per recipe?=C2=A0 For=20
example, my bitbake recipe produces a web application which packages=20
many HTML components.=C2=A0 I would like to have the recipe included in t=
he=20
SBOM together with the components which are packaged into the web=20
application files.=C2=A0 Is there a way to do that?

Specifically, the OpenBMC web application uses various NPM compoents to=20
provide it functionality in the end-user's browser.
Recipe:=20
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phos=
phor/webui/webui-vue_git.bb=20

Project source: https://github.com/openbmc/webui-vue/
NPM packages are specified here:=20
https://github.com/openbmc/webui-vue/blob/master/package-lock.json
Package-lock docs:=20
https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json

I want my SBOM to include the webui-vue application together with each=20
of the NPM packages it uses.=E2=80=A8=C2=A0 How can I do that?

Sincerely,
Joseph Reynolds


