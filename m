Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=393c5c6b8=rich.pixley@palm.com>)
	id 1S0MzY-000770-LH for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 01:57:05 +0100
X-IronPort-AV: E=Sophos;i="4.73,466,1325491200"; d="scan'208,217";a="11846353"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 22 Feb 2012 16:47:38 -0800
Received: from fuji.noir.com ([10.100.2.13])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1N0lb1L027665;
	Wed, 22 Feb 2012 16:47:37 -0800
Message-ID: <4F458CAA.7040107@palm.com>
Date: Wed, 22 Feb 2012 16:47:38 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F457B4B.4000507@palm.com>
	<CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
	<E9FAD6E1E68141CCA2CF166F1762B320@gmail.com>
In-Reply-To: <E9FAD6E1E68141CCA2CF166F1762B320@gmail.com>
Subject: Re: sharing DL_DIR?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 00:57:05 -0000
Content-Type: multipart/alternative;
	boundary="------------060805080208090009000806"

--------------060805080208090009000806
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

What happens if two separate bitbake invocations both simultaneously 
attempt to download the same file?

--rich

On 2/22/12 15:41 , Christopher Larson wrote:
> I share it as well. I don't see locks being a big issue for most 
> things, as the worst case is a re-download, not use of a corrupt or 
> incomplete file, due to the completion stamps.
>
> -- 
> Christopher Larson
>
> On Wednesday, February 22, 2012 at 4:39 PM, Tom King wrote:
>
>> I have a single downloads directory with symlinks for every target 
>> build I have to that directory.  As long as I have the source already 
>> in there I don't fetch  it again
>>
>> Tom
>>
>> On Wed, Feb 22, 2012 at 1:33 PM, Rich Pixley <rich.pixley@palm.com 
>> <mailto:rich.pixley@palm.com>> wrote:
>>> Is it reasonable to expect to share DL_DIR between multiple builds?
>>>
>>> That is, are downloads properly locked so that multiple concurrent 
>>> downloads of the same file won't collide?  And if so, are they NFS 
>>> safe locks?
>>>
>>> Or must each build download it's own copies of every component?
>>>
>>> I ask because our, (Palm), branch has been, but it's a bit of a 
>>> nuisance to pick a suitable locking mechanism that is both 
>>> functional and performant.
>>>
>>>   * Flock/lockf aren't reliably supported in heterogeneous environments.
>>>   * The old lockfiles don't work over NFS. Lock directories
>>>     apparently do, but trying to clean these up after interruptions
>>>     or failures is a losing battle so if we do use these, we end up
>>>     with orphan locks periodically.
>>>   * With NFS as a possibility, we can't assume any kernel local IPC
>>>     mechanism, so sysV ipc is out.
>>>   * It seems like a pretty huge overhead to try to create any sort
>>>     of zeroconf overhead.
>>>
>>> Our solution so far has been to use NFS lock directories for 
>>> multiple machine builds and flock/lockf for single machine builds.  
>>> This mostly works, though it's not ideal, and it's significantly 
>>> faster than downloading/copying all of the component source multiple 
>>> times even over local mirrors.
>>>
>>> --rich
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org 
>>> <mailto:Openembedded-core@lists.openembedded.org>
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--------------060805080208090009000806
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    What happens if two separate bitbake invocations both simultaneously
    attempt to download the same file?<br>
    <br>
    --rich<br>
    <br>
    On 2/22/12 15:41 , Christopher Larson wrote:
    <blockquote cite="mid:E9FAD6E1E68141CCA2CF166F1762B320@gmail.com"
      type="cite">
      <div style="font-family: Helvetica; font-size: 13px; ">I share it
        as well. I don't see locks being a big issue for most things, as
        the worst case is a re-download, not use of a corrupt or
        incomplete file, due to the completion stamps.<br>
      </div>
      <div>
        <div><br>
        </div>
        <div>-- </div>
        <div>Christopher Larson</div>
        <div><br>
        </div>
      </div>
      <p style="color: #A0A0A8;">On Wednesday, February 22, 2012 at 4:39
        PM, Tom King wrote:</p>
      <blockquote type="cite"
style="border-left-style:solid;border-width:1px;margin-left:0px;padding-left:10px;">
        <span>
          <div>
            <div>I have a single downloads directory with symlinks for
              every target build I have to that directory.  As long as I
              have the source already in there I don't fetch  it again
              <div><br>
              </div>
              <div>Tom<br>
                <br>
                <div>
                  On Wed, Feb 22, 2012 at 1:33 PM, Rich Pixley <span
                    dir="ltr">&lt;<a moz-do-not-send="true"
                      href="mailto:rich.pixley@palm.com">rich.pixley@palm.com</a>&gt;</span>
                  wrote:<br>
                  <blockquote type="cite">
                    <div>
                      <div bgcolor="#FFFFFF" text="#000000"> Is it
                        reasonable to expect to share DL_DIR between
                        multiple builds?<br>
                        <br>
                        That is, are downloads properly locked so that
                        multiple concurrent downloads of the same file
                        won't collide?  And if so, are they NFS safe
                        locks?<br>
                        <br>
                        Or must each build download it's own copies of
                        every component?<br>
                        <br>
                        I ask because our, (Palm), branch has been, but
                        it's a bit of a nuisance to pick a suitable
                        locking mechanism that is both functional and
                        performant.<br>
                        <ul>
                          <li>Flock/lockf aren't reliably supported in
                            heterogeneous environments.</li>
                          <li>The old lockfiles don't work over NFS.
                            Lock directories apparently do, but trying
                            to clean these up after interruptions or
                            failures is a losing battle so if we do use
                            these, we end up with orphan locks
                            periodically.</li>
                          <li>With NFS as a possibility, we can't assume
                            any kernel local IPC mechanism, so sysV ipc
                            is out.</li>
                          <li>It seems like a pretty huge overhead to
                            try to create any sort of zeroconf overhead.</li>
                        </ul>
                        <p>Our solution so far has been to use NFS lock
                          directories for multiple machine builds and
                          flock/lockf for single machine builds.  This
                          mostly works, though it's not ideal, and it's
                          significantly faster than downloading/copying
                          all of the component source multiple times
                          even over local mirrors.<span><font
                              color="#888888"><br>
                            </font></span></p>
                        <span><font color="#888888"> --rich<br>
                          </font></span></div>
                      <br>
                      _______________________________________________<br>
                      Openembedded-core mailing list<br>
                      <a moz-do-not-send="true"
                        href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                      <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                        target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                      <br>
                    </div>
                  </blockquote>
                </div>
                <br>
              </div>
            </div>
            <div>
              <div>_______________________________________________</div>
              <div>Openembedded-core mailing list</div>
              <div><a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></div>
              <div><a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></div>
            </div>
          </div>
        </span> </blockquote>
      <div> <br>
      </div>
    </blockquote>
  </body>
</html>

--------------060805080208090009000806--
