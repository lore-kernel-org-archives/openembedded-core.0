Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DBE2872C04
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 20:05:14 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t44K59O7017764; Mon, 4 May 2015 15:05:09 -0500
Received: from [10.2.33.36] ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015050415050999-769915 ;
	Mon, 4 May 2015 15:05:09 -0500 
Message-ID: <5547D0EE.8000309@ni.com>
Date: Mon, 04 May 2015 15:05:02 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20150501160602.GA5885@denix.org> <5543FA71.9060903@ni.com>
	<20150504185017.GB5885@denix.org> <20150504191916.GC5885@denix.org>
In-Reply-To: <20150504191916.GC5885@denix.org>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/04/2015 03:05:09 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/04/2015 03:05:10 PM,
	Serialize complete at 05/04/2015 03:05:10 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-04_04:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 04 May 2015 20:05:18 -0000
Content-Type: multipart/alternative;
	boundary="------------040200090104050300090603"

--------------040200090104050300090603
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252



On 05/04/2015 02:19 PM, Denys Dmytriyenko wrote:
> On Mon, May 04, 2015 at 02:50:17PM -0400, Denys Dmytriyenko wrote:
>> On Fri, May 01, 2015 at 05:13:05PM -0500, Alejandro del Castillo wrote:
>>>
>>> On 05/01/2015 11:06 AM, Denys Dmytriyenko wrote:
>>>> Hi,
>>>>
>>>> Has anyone ever seen this message during <image>.do_rootfs task?
>>>>
>>>> Collected errors:
>>>>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
>>>>  * opkg_install_cmd: Cannot install package <package>.
>>>>
>>>> We started seeing it on random packages inside the <image> few weeks ago on 
>>>> different machines. At the time we had switched to bitbake 1.26. But even 
>>>> trying different bitbake versions still occasionally caused the same error, so 
>>>> the culprit is still unknwon. Using oe-core/daisy for now.
>>>>
>>>> Any comments or suggestions to where start looking would be appreciated! 
>>>> Thanks.
>>> The error is saying that there is a mismatch between the registered package 
>>> mds5sum and the actual md5sum of the package. On your log.do_rootfs log file 
>>> you should find the opkg-cl command being called, which has an opkg.conf 
>>> file as parameter. Inside the conf file, you will see the paths to the local 
>>> repos being used to build your image.  Can you confirm that the registered 
>>> md5sum for one of the problematic packages on the Package file on the repo 
>>> doesn't match the actual package md5sum?
>> Yes, md5sum of the package doesn't match the one recorded in the Packages file 
>> of the local feed.
>>
>> BTW, this seems to only happen to arch-less packages from the "all" feed, 
>> mainly packagegroups...
> And then I realized that the failing packagegroup shouldn't really be 
> arch-less! Apparently, I misplaced PACKAGE_ARCH = "${MACHINE_ARCH}" before 
> inheriting packagegroup class. Oops!
>
For Dizzy and Fido, I think the order changed (you need to place PACKAGE_ARCH
before inherit packagegroup). The good news is that if you upgrade, there is a
check that breaks the build if the bad ordering is detected (
30aaada4b79fc1acad5fdaba98071b63c52b9e05).

--------------040200090104050300090603
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset=windows-1252

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 05/04/2015 02:19 PM, Denys
      Dmytriyenko wrote:<br>
    </div>
    <blockquote cite="mid:20150504191916.GC5885@denix.org" type="cite">
      <pre wrap="">On Mon, May 04, 2015 at 02:50:17PM -0400, Denys Dmytriyenko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Fri, May 01, 2015 at 05:13:05PM -0500, Alejandro del Castillo wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">

On 05/01/2015 11:06 AM, Denys Dmytriyenko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">Hi,

Has anyone ever seen this message during &lt;image&gt;.do_rootfs task?

Collected errors:
 * opkg_install_pkg: Package &lt;package&gt; md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package &lt;package&gt;.

We started seeing it on random packages inside the &lt;image&gt; few weeks ago on 
different machines. At the time we had switched to bitbake 1.26. But even 
trying different bitbake versions still occasionally caused the same error, so 
the culprit is still unknwon. Using oe-core/daisy for now.

Any comments or suggestions to where start looking would be appreciated! 
Thanks.
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="">
</pre>
        <blockquote type="cite">
          <pre wrap="">The error is saying that there is a mismatch between the registered package 
mds5sum and the actual md5sum of the package. On your log.do_rootfs log file 
you should find the opkg-cl command being called, which has an opkg.conf 
file as parameter. Inside the conf file, you will see the paths to the local 
repos being used to build your image.  Can you confirm that the registered 
md5sum for one of the problematic packages on the Package file on the repo 
doesn't match the actual package md5sum?
</pre>
        </blockquote>
        <pre wrap="">
Yes, md5sum of the package doesn't match the one recorded in the Packages file 
of the local feed.

BTW, this seems to only happen to arch-less packages from the "all" feed, 
mainly packagegroups...
</pre>
      </blockquote>
      <pre wrap="">
And then I realized that the failing packagegroup shouldn't really be 
arch-less! Apparently, I misplaced PACKAGE_ARCH = "${MACHINE_ARCH}" before 
inheriting packagegroup class. Oops!

</pre>
    </blockquote>
    For Dizzy and Fido, I think the order changed (you need to place
    PACKAGE_ARCH before inherit packagegroup). The good news is that if
    you upgrade, there is a check that breaks the build if the bad
    ordering is detected (
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <span style="color: rgb(0, 0, 0); font-family: monospace; font-size:
      12px; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: normal; orphans:
      auto; text-align: start; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; display: inline !important; float:
      none; background-color: rgb(255, 255, 255);">30aaada4b79fc1acad5fdaba98071b63c52b9e05).
      <br>
    </span>
  </body>
</html>

--------------040200090104050300090603--
