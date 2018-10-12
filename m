Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDB6D794BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:03:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C93KGN024195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 02:03:30 -0700
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 12 Oct 2018 02:03:09 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20181011095511.5509-1-hongxu.jia@windriver.com>
	<e8b42506cdaf9437f715100f0ff6541d5ed3c894.camel@linuxfoundation.org>
	<8fe4eb7c-a838-e1da-a1a2-7acd201d9977@windriver.com>
	<3012dac0-ec3a-bfd8-fb58-27be91642b4d@windriver.com>
	<62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d79efe64-c2a1-fb09-d174-7d27ab741442@windriver.com>
Date: Fri, 12 Oct 2018 17:03:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org>
Subject: Re: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Fri, 12 Oct 2018 09:03:56 -0000
Content-Type: multipart/alternative;
	boundary="------------E69EAB5AEB2DB57BCB201AAF"
Content-Language: en-US

--------------E69EAB5AEB2DB57BCB201AAF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年10月12日 16:57, richard.purdie@linuxfoundation.org wrote:
>> Hi RP,
>>
>> With some digging on upstream, more than perl version,
>> the building also requires to install perl Text::Template module
>> which does not exist in core perl, I think we have to add the recipe
>>
>> [snip]
>>    Notes on Perl modules we use
>>    ----------------------------
>>    We make increasing use of Perl modules, and do our best to limit
>>    ourselves to core Perl modules to keep the requirements down. There
>>    are just a few exceptions:
>>    Test::More         We require the minimum version to be 0.96, which
>>                       appeared in Perl 5.13.4, because that version
>> was
>>                       the first to have all the features we're using.
>>                       This module is required for testing only!  If
>> you
>>                       don't plan on running the tests, you don't need
>> to
>>                       bother with this one.
>>
>>    Text::Template     This module is not part of the core Perl
>> modules.
>>                       As a matter of fact, the core Perl modules do
>> not
>>                       include any templating module to date.
>>                       This module is absolutely needed, configuration
>> depends on it.
>> [snip]
>>
>> https://github.com/openssl/openssl/blob/master/NOTES.PERL
>>
> https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6
>
> That is a good find. Perhaps we could check for that in sanity.bbclass?
> Is it commonly available in distributions like centos?
I am afraid the perl module (Text::Template) is not common,
available on most distro, since they do not need to build
openssl :(

But I am curious that without that perl module, the build seem
ok with newer perl (perl v5.22.1 in ubuntu 1804 and without Text::Template)

I am going on digging the root cause why the build works well
without the perl module

//Hongxu


> I am worried about the build time impact of a nativeperl dependency as
> whilst your test doesn't show it in the image build, it will show up on
> slower build machines with fewer threads.
>
> Cheers,
>
> Richard
>


--------------E69EAB5AEB2DB57BCB201AAF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年10月12日 16:57,
      <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">Hi RP,

With some digging on upstream, more than perl version,
the building also requires to install perl Text::Template module
which does not exist in core perl, I think we have to add the recipe

[snip]
  Notes on Perl modules we use
  ----------------------------
  We make increasing use of Perl modules, and do our best to limit
  ourselves to core Perl modules to keep the requirements down. There
  are just a few exceptions:
  Test::More         We require the minimum version to be 0.96, which
                     appeared in Perl 5.13.4, because that version
was
                     the first to have all the features we're using.
                     This module is required for testing only!  If
you
                     don't plan on running the tests, you don't need
to
                     bother with this one.

  Text::Template     This module is not part of the core Perl
modules.
                     As a matter of fact, the core Perl modules do
not
                     include any templating module to date.
                     This module is absolutely needed, configuration
depends on it.
[snip]

<a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/blob/master/NOTES.PERL" moz-do-not-send="true">https://github.com/openssl/openssl/blob/master/NOTES.PERL</a>

</pre>
      </blockquote>
      <pre wrap=""><a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6" moz-do-not-send="true">https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6</a>

That is a good find. Perhaps we could check for that in sanity.bbclass?
Is it commonly available in distributions like centos? 
</pre>
    </blockquote>
    I am afraid the perl module (Text::Template) is not common,<br>
    available on most distro, since they do not need to build<br>
    openssl :(<br>
    <br>
    But I am curious that without that perl module, the build seem<br>
    ok with newer perl (perl v5.22.1 in ubuntu 1804 and without
    Text::Template)<br>
    <br>
    I am going on digging the root cause why the build works well<br>
    without the perl module<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org">
      <pre wrap="">
I am worried about the build time impact of a nativeperl dependency as
whilst your test doesn't show it in the image build, it will show up on
slower build machines with fewer threads.

Cheers,

Richard

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------E69EAB5AEB2DB57BCB201AAF--
