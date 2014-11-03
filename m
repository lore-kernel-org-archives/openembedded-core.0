Return-Path: <Chris.Carr@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0289160E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 13:18:50 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
	by m0047961.ppops.net-00176a03. (8.14.7/8.14.7) with SMTP id
	sA3DBjcc028782 for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 08:18:51 -0500
Received: from alpmlip14.e2k.ad.ge.com ([12.43.191.1])
	by m0047961.ppops.net-00176a03. with ESMTP id 1qea7800j7-17
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 08:18:50 -0500
Received: from unknown (HELO ALPMBHT04.e2k.ad.ge.com) ([3.159.19.197])
	by alpmlip14.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	03 Nov 2014 08:14:00 -0500
Received: from CINMBAPD01.e2k.ad.ge.com (3.159.212.67) by
	ALPMBHT04.e2k.ad.ge.com (3.159.19.197) with Microsoft SMTP Server (TLS)
	id 14.3.195.1; Mon, 3 Nov 2014 08:18:39 -0500
Received: from [3.26.68.158] (3.159.212.191) by CINMBAPD01.e2k.ad.ge.com
	(3.159.212.67) with Microsoft SMTP Server id 14.3.195.1; Mon, 3 Nov 2014
	08:18:38 -0500
Message-ID: <545780AD.30106@ge.com>
Date: Mon, 3 Nov 2014 13:18:37 +0000
From: "Carr, Chris (GE Intelligent Platforms)" <chris.carr@ge.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1414352182-30029-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8cVn-EuWaFT3KsAOKP_QoKwcGxE7QSqFNHoe6mQERRcdA@mail.gmail.com>
In-Reply-To: <CANyK_8cVn-EuWaFT3KsAOKP_QoKwcGxE7QSqFNHoe6mQERRcdA@mail.gmail.com>
X-Originating-IP: [3.159.212.191]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-03_02:2014-11-03, 2014-11-03,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0 phishscore=0
	adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=7.0.1-1402240000 definitions=main-1411030120
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: Fix BAD_RECOMMENDATIONS for opkg
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
X-List-Received-Date: Mon, 03 Nov 2014 13:19:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 26/10/2014 19:37, Paul Barker wrote:
> On 26 October 2014 19:36, Paul Barker <paul@paulbarker.me.uk> wrote:
>> In package_manager.py, when using opkg as the packager, the command 'opkg <args>
>> info <pkg>' is called to get information about each pkg in BAD_RECOMMENDATIONS
>> in a format that can be written to the status file. The 'Status: ...' line is
>> modified and all other lines are passed through. Changing the verbosity level
>> argument for this command will change what it written into the status file.
>> Crucially, with the default verbosity level, no blank lines are being printed by
>> the opkg command and so no blank lines are being written to the status file to
>> separate each package entry.
>>
>> The package parsing code in opkg expects package entries in the status file to
>> be separated by at least one blank line. If no blank line is seen, the next
>> package entry is interpreted as a continuation of the last package entry, but
>> the new values overwrite the old values.
>>
>> So with the default verbosity level, a blank line follows some package entries
>> and these are parsed. The others are dropped due to the lack of blank lines. As
>> the verbosity increases, more debugging messages add blank lines and more
>> packages are parsed.
>>
>> The solution to ensure that this works correctly regardless of the verbosity
>> level is simply add a blank line after the output of 'opkg info' is written to
>> the status file, ensuring that the next package is separated from the current
>> package.
>>
>> [YOCTO #6816]
>>
>> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>> Cc: Chris Carr <chris.carr@ge.com>
>> ---
>>  meta/lib/oe/package_manager.py | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>> index ffb83b2..85d7fd4 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -1408,6 +1408,10 @@ class OpkgPM(PackageManager):
>>                      else:
>>                          status.write(line + "\n")
>>
>> +                # Append a blank line after each package entry to ensure that it
>> +                # is separated from the following entry
>> +                status.write("\n")
>> +
>>      '''
>>      The following function dummy installs pkgs and returns the log of output.
>>      '''
>> --
>> 2.1.2
>>
> 
> Chris, could you give this a test and let us know if it fixes the issue.
> 
> Thanks,
> 

Paul,

I've tried the patch with my build and all the packages in BAD_RECOMMENDATIONS are now being processed correctly and do not appear in the target rootfs.

[My subscription to the OE Core mailing list had quietly expired, so I've re-subscribed to ensure that this reply goes to the list as well]

Chris Carr

