Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D87A60C19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:31:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIVGOX026303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 11:31:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:31:16 -0700
Message-ID: <53346E73.6080006@windriver.com>
Date: Thu, 27 Mar 2014 13:31:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1395717014.git.liezhi.yang@windriver.com>	<5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>	<CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>	<1395942565.24890.156.camel@ted>	<CABcZAN=K8Rs2p1fCgkweJgpGEaji+Df-38ng7ZBx5ws4C-opRg@mail.gmail.com>
	<20140327181313.GS3709@jama>
In-Reply-To: <20140327181313.GS3709@jama>
Subject: Re: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Thu, 27 Mar 2014 18:31:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/14, 1:13 PM, Martin Jansa wrote:
> On Thu, Mar 27, 2014 at 10:53:20AM -0700, Chris Larson wrote:
>> On Thu, Mar 27, 2014 at 10:49 AM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Thu, 2014-03-27 at 10:21 -0700, Chris Larson wrote:
>>>>
>>>> On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang
>>>> <liezhi.yang@windriver.com> wrote:
>>>>          If we run "bitbake -S base-files" today, and re-run it
>>>>          tomorrow with
>>>>          nothing changed, we would see that the do_install.sigdata
>>>>          changes
>>>>          because of:
>>>>
>>>>          do_intall -> do_install_basefilesissue -> DISTRO_VERSION ->
>>>>          DATE
>>>>
>>>>          We had set:
>>>>          IMAGE_NAME[vardepsexclude] += "DATETIME"
>>>>          in meta/conf/bitbake.conf, we can set a similar line in
>>>>          base-files_3.0.14.bb to fix the problem.
>>>>
>>>>          [YOCTO #6032]
>>>>
>>>>          Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>
>>>> Wont't this mean base-files wouldn't be rebuilt when the day changes?
>>>> This seems problematic to me. I think this is a legitimate case for a
>>>> checksum change. If the distro version changes due to the date
>>>> changing, and the base-files includes the distro version in the issue
>>>> file, then we'd *want* base-files to rebuild to ensure the issue file
>>>> is correct, otherwise it'd be inaccurate, no?
>>>>
>>> I'm torn on this. Package feed creators probably don't want a package
>>> feed where the package changes daily but I can see this from both sides,
>>> I have often wondered why my build was rebuilding base-files...
>>
>>
>> Perhaps we should either not use DATE/TIME in the distro version at all, or
>> have a variable which is the current date, and a variable which locks to
>> the date of the creation of the TMPDIR but doesn't change after that, or
>> something, as a more persistent build environment identifier to use for
>> such cases. *shrug*
>
> I think that the DATE specific part should be moved to separate recipe
> which will clearly indicate it's just "build version".
>
> I'm using shr-version recipe which just puts file in sysconfdir so it's
> not so surprising to see shr-version recipe being rebuilt everyday and I
> still know when the user last updated from feed.
>
> It's also useful to pull such recipe into image by IMAGE_INSTALL not
> through packagegroup (as otherwise the packagegroup could be rebuilt
> every day as well - at least until runtime deps for packagegroups were
> excluded in signature handler).

This is a good place where separating version/build information from the 
basefiles makes a lot of sense.  Rebuilding one small package daily for the 
purpose of knowing you are "current" is a lot better then potentially screwing 
with the base-files on the system (unless they've been changed and need to be 
updated.)

--Mark


