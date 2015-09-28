Return-Path: <ian.ray@ge.com>
X-Greylist: delayed 1727 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Sep 2015 15:15:31 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id D721773D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 15:15:31 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
	by m0047961.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8SEkESx034910 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 10:46:43 -0400
Received: from alpmlip10.e2k.ad.ge.com ([12.43.191.1])
	by m0047961.ppops.net-00176a03. with ESMTP id 1x5q0bba3d-8
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 10:46:43 -0400
Received: from unknown (HELO ALPMBHT03.e2k.ad.ge.com) ([3.159.19.196])
	by alpmlip10.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	28 Sep 2015 10:46:31 -0400
Received: from BUDURLND11.e2k.ad.ge.com (3.159.54.67) by
	ALPMBHT03.e2k.ad.ge.com (3.159.19.196) with Microsoft SMTP Server (TLS)
	id 14.3.224.2; Mon, 28 Sep 2015 10:46:31 -0400
Received: from BUDURBPA11.e2k.ad.ge.com ([169.254.5.78]) by
	BUDURLND11.e2k.ad.ge.com ([169.254.9.209]) with mapi id 14.03.0224.002;
	Mon, 28 Sep 2015 16:46:29 +0200
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: Tudor Florea <tudor.florea@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [yocto][PATCH 1/1] ptest: user-specified run-ptest
	script location
Thread-Index: AQHQ9D12gDdNURG4z0uEytnw+fttNJ5R3wsAgAAscpA=
Date: Mon, 28 Sep 2015 14:46:29 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
In-Reply-To: <56094576.6070803@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.54.224]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509280207
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Mon, 28 Sep 2015 15:15:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tudor

On 28 September 2015, Tudor Florea wrote:
> On 9/21/2015 10:11, Ian Ray wrote:
>> Provides a new variable, PTEST_RUN_SCRIPT_PATH, which points to a
>> directory where the run-ptest script is located.  This location
>> defaults to the work directory but may be overridden within a recipe
(snip)
> Is there any benefit in adding this? Do you have an example of package
> that contains a run-ptest file that could benefit of this approach?

The main benefit is for packages that are run-ptest /aware/, in which case
the recipe can be simplified.

I only have examples of our own, internal, packages which have been
developed with ptest in mind.

> Usually, run-ptest is not part of the package but rather is a standalone
> file referred by the package recipe. It is the responsibility of the
> person implementing ptest functionality come up with a run-ptest file
> (containing a script to be run on target to implement testing
> functionality) hence is his/her responsibility as well to put it in the
> right place.

Right.  And if the right place is /inside/ the package, then this patch mak=
es
the recipe more explicit.  Admittedly, without this patch one can simply
copy the file explicitly in the recipe.

do_compile_ptest () {
        oe_runmake buildtest-TESTS
        cp ${S}/path/to/run-ptest ${WORKDIR}
}


